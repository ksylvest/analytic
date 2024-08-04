import { useMemo, type FC } from "react";

import { Group } from "@visx/group";
import { Bar } from "@visx/shape";
import { scaleBand, scaleLinear } from "@visx/scale";
import { AxisBottom, AxisLeft } from "@visx/axis";
import { GridColumns, GridRows } from "@visx/grid";
import { ParentSize } from "@visx/responsive";

const BAR_BG = "#6366f1"; // indigo-500
const CHART_BG = "#f8fafc"; // slate-50
const GRID_COLOR = "#e2e8f0"; // slate-200
const AXIS_TICK_COLOR = GRID_COLOR;
const AXIS_LINE_COLOR = GRID_COLOR;

const CHART_ML = 60; // px
const CHART_MB = 60; // px
const CHART_MT = 40; // px
const CHART_MR = 40; // px

const TICK_LABEL_PROPS = {
  fill: "#718096", // slate-600
  fontSize: 10,
  fontFamily: `"ui-sans-serif", "system-ui", "sans-serif"`,
} as const;

type Entry = {
  label: string;
  value: number;
};

const Bars: FC<{
  width: number;
  height: number;
  entries: Entry[];
}> = ({ width, height, entries }) => {
  const xScale = useMemo(
    () =>
      scaleBand<string>({
        range: [0, width],
        round: true,
        domain: entries.map(({ label }) => label),
        padding: 0.4,
      }),
    [width]
  );
  const yScale = useMemo(
    () =>
      scaleLinear<number>({
        range: [height, 0],
        round: true,
        domain: [0, Math.max(...entries.map(({ value }) => value))],
      }),
    [height]
  );

  return (
    <>
      <GridRows
        scale={yScale}
        width={width}
        height={height}
        stroke={GRID_COLOR}
      />

      <GridColumns
        scale={xScale}
        width={width}
        height={height}
        stroke={GRID_COLOR}
      />

      {entries.map((entry, index) => {
        const barWidth = xScale.bandwidth();
        const barHeight = height - yScale(entry.value);
        const barX = xScale(entry.label);
        const barY = height - barHeight;

        return (
          <Bar
            key={index}
            x={barX}
            y={barY}
            rx={8}
            ry={8}
            width={barWidth}
            height={barHeight}
            fill={BAR_BG}
          />
        );
      })}

      <AxisBottom
        top={height}
        scale={xScale}
        stroke={AXIS_LINE_COLOR}
        tickStroke={AXIS_TICK_COLOR}
        tickLabelProps={TICK_LABEL_PROPS}
      />

      <AxisLeft
        left={0}
        scale={yScale}
        stroke={AXIS_LINE_COLOR}
        tickStroke={AXIS_TICK_COLOR}
        tickLabelProps={TICK_LABEL_PROPS}
      />
    </>
  );
};

export const Chart: FC<{
  height?: number;
  entries?: Entry[];
}> = ({ height = 300, entries }) => (
  <ParentSize>
    {({ width }) => (
      <svg width={width} height={height}>
        <rect
          x={0}
          y={0}
          rx={4}
          ry={4}
          width={width}
          height={height}
          fill={CHART_BG}
        />

        <Group top={CHART_MT} left={CHART_ML}>
          <Bars
            width={width - CHART_MR - CHART_ML}
            height={height - CHART_MT - CHART_MB}
            entries={entries}
          />
        </Group>
      </svg>
    )}
  </ParentSize>
);
