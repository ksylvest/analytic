import { useMemo, type FC } from "react";

import { LinearGradient } from "@visx/gradient";
import { Group } from "@visx/group";
import { Bar } from "@visx/shape";
import { scaleBand, scaleLinear } from "@visx/scale";
import { AxisBottom, AxisLeft } from "@visx/axis";
import { GridColumns, GridRows } from "@visx/grid";
import { ParentSize } from "@visx/responsive";

const CHART_BG_FROM = "#f1f5f9"; // slate-100
const CHART_BG_TO = "#e2e8f0"; // slate-200
const CHART_BAR_FROM = "#818cf8"; // indigo-400
const CHART_BAR_TO = "#7c3aed"; // violet-600

const GRID_COLOR = "#cbd5e1"; // slate-300
const AXIS_TICK_COLOR = GRID_COLOR;
const AXIS_LINE_COLOR = GRID_COLOR;

const CHART_ML = 60; // px
const CHART_MB = 60; // px
const CHART_MT = 40; // px
const CHART_MR = 40; // px

type Entry = {
  label: string;
  value: number;
};

const ENTRIES: Entry[] = [
  { label: "Jan, 2024", value: 404 },
  { label: "Feb, 2024", value: 303 },
  { label: "Mar, 2024", value: 250 },
  { label: "Apr, 2024", value: 304 },
  { label: "May, 2024", value: 404 },
  { label: "Jun, 2024", value: 604 },
];

const Bars: FC<{
  width: number;
  height: number;
}> = ({ width, height }) => {
  const xScale = useMemo(
    () =>
      scaleBand<string>({
        range: [0, width],
        round: true,
        domain: ENTRIES.map(({ label }) => label),
        padding: 0.4,
      }),
    [width]
  );
  const yScale = useMemo(
    () =>
      scaleLinear<number>({
        range: [height, 0],
        round: true,
        domain: [0, Math.max(...ENTRIES.map(({ value }) => value))],
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

      {ENTRIES.map((entry, index) => {
        const barWidth = xScale.bandwidth();
        const barHeight = height - yScale(entry.value);
        const barX = xScale(entry.label);
        const barY = height - barHeight;

        return (
          <>
            <Bar
              key={index}
              x={barX}
              y={barY}
              rx={8}
              ry={8}
              width={barWidth}
              height={barHeight}
              fill="url(#chart-bar)"
            />
          </>
        );
      })}

      <AxisBottom
        top={height}
        scale={xScale}
        stroke={AXIS_LINE_COLOR}
        tickStroke={AXIS_TICK_COLOR}
      />

      <AxisLeft
        left={0}
        scale={yScale}
        stroke={AXIS_LINE_COLOR}
        tickStroke={AXIS_TICK_COLOR}
      />
    </>
  );
};

export const Chart: FC<{
  height?: number;
}> = ({ height = 300 }) => (
  <ParentSize>
    {({ width }) => (
      <svg width={width} height={height}>
        <LinearGradient id="chart-bg" from={CHART_BG_FROM} to={CHART_BG_TO} />
        <LinearGradient
          id="chart-bar"
          from={CHART_BAR_FROM}
          to={CHART_BAR_TO}
        />

        <rect
          x={0}
          y={0}
          rx={4}
          ry={4}
          width={width}
          height={height}
          fill="url(#chart-bg)"
        />

        <Group top={CHART_MT} left={CHART_ML}>
          <Bars
            width={width - CHART_MR - CHART_ML}
            height={height - CHART_MT - CHART_MB}
          />
        </Group>
      </svg>
    )}
  </ParentSize>
);
