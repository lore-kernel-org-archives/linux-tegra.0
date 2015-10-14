From: Sakshi Bansal <sakshi.april5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] staging: comedi: fixed few coding style warnings
Date: Wed, 14 Oct 2015 19:33:00 +0530
Message-ID: <20151014140300.GA22848@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org, marvin24-Mmb7MZpHnFY@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Fixed block comments usage of * on subsequent lines

Signed-off-by: Sakshi Bansal <sakshi.april5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/staging/comedi/comedi.h        | 181 +++++++++++++++++++--------------
 drivers/staging/comedi/comedi_pcmcia.h |   3 +-
 drivers/staging/comedi/comedilib.h     |  26 ++---
 3 files changed, 120 insertions(+), 90 deletions(-)

diff --git a/drivers/staging/comedi/comedi.h b/drivers/staging/comedi/comedi.h
index 66edda1..31a43ee 100644
--- a/drivers/staging/comedi/comedi.h
+++ b/drivers/staging/comedi/comedi.h
@@ -1,20 +1,20 @@
 /*
-    include/comedi.h (installed as /usr/include/comedi.h)
-    header file for comedi
+ *  include/comedi.h (installed as /usr/include/comedi.h)
+ *  header file for comedi
 
-    COMEDI - Linux Control and Measurement Device Interface
-    Copyright (C) 1998-2001 David A. Schleef <ds-XoJnaB+qp91AfugRpC6u6w@public.gmane.org>
+ *  COMEDI - Linux Control and Measurement Device Interface
+ *  Copyright (C) 1998-2001 David A. Schleef <ds-XoJnaB+qp91AfugRpC6u6w@public.gmane.org>
 
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU Lesser General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU Lesser General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
 
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-*/
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ */
 
 #ifndef _COMEDI_H
 #define _COMEDI_H
@@ -28,9 +28,9 @@
 #define COMEDI_MAJOR 98
 
 /*
-   maximum number of minor devices.  This can be increased, although
-   kernel structures are currently statically allocated, thus you
-   don't want this to be much more than you actually use.
+ * maximum number of minor devices.  This can be increased, although
+ * kernel structures are currently statically allocated, thus you
+ * don't want this to be much more than you actually use.
  */
 #define COMEDI_NDEVICES 16
 
@@ -279,7 +279,8 @@ enum configuration_ids {
 	INSN_CONFIG_SET_OTHER_SRC = 2005, /* Set other source */
 	/* INSN_CONFIG_GET_OTHER_SRC = 2006,*//* Get other source */
 	/* Get size in bytes of subdevice's on-board fifos used during
-	 * streaming input/output */
+	 * streaming input/output
+	 */
 	INSN_CONFIG_GET_HARDWARE_BUFFER_SIZE = 2006,
 	INSN_CONFIG_SET_COUNTER_MODE = 4097,
 	/* INSN_CONFIG_8254_SET_MODE is deprecated */
@@ -292,7 +293,8 @@ enum configuration_ids {
 	INSN_CONFIG_PWM_GET_PERIOD = 5001,	/* gets frequency */
 	INSN_CONFIG_GET_PWM_STATUS = 5002,	/* is it running? */
 	/* sets H bridge: duty cycle and sign bit for a relay at the
-	 * same time */
+	 * same time
+	 */
 	INSN_CONFIG_PWM_SET_H_BRIDGE = 5003,
 	/* gets H bridge data: duty cycle and the sign bit */
 	INSN_CONFIG_PWM_GET_H_BRIDGE = 5004
@@ -521,23 +523,23 @@ struct comedi_bufinfo {
 /**********************************************************/
 
 /*
-  8254 specific configuration.
+ * 8254 specific configuration.
 
-  It supports two config commands:
+ * It supports two config commands:
 
-  0 ID: INSN_CONFIG_SET_COUNTER_MODE
-  1 8254 Mode
-    I8254_MODE0, I8254_MODE1, ..., I8254_MODE5
-    OR'ed with:
-    I8254_BCD, I8254_BINARY
+ * 0 ID: INSN_CONFIG_SET_COUNTER_MODE
+ * 1 8254 Mode
+ *   I8254_MODE0, I8254_MODE1, ..., I8254_MODE5
+ *   OR'ed with:
+ *   I8254_BCD, I8254_BINARY
 
-  0 ID: INSN_CONFIG_8254_READ_STATUS
-  1 <-- Status byte returned here.
-    B7 = Output
-    B6 = NULL Count
-    B5 - B0 Current mode.
+ * 0 ID: INSN_CONFIG_8254_READ_STATUS
+ * 1 <-- Status byte returned here.
+ *   B7 = Output
+ *   B6 = NULL Count
+ *   B5 - B0 Current mode.
 
-*/
+ */
 
 enum i8254_mode {
 	I8254_MODE0 = (0 << 1),	/* Interrupt on terminal count */
@@ -546,9 +548,11 @@ enum i8254_mode {
 	I8254_MODE3 = (3 << 1),	/* Square wave mode */
 	I8254_MODE4 = (4 << 1),	/* Software triggered strobe */
 	I8254_MODE5 = (5 << 1),	/* Hardware triggered strobe
-				 * (retriggerable) */
+				 * (retriggerable)
+				 */
 	I8254_BCD = 1,		/* use binary-coded decimal instead of binary
-				 * (pretty useless) */
+				 * (pretty useless)
+				 */
 	I8254_BINARY = 0
 };
 
@@ -556,7 +560,8 @@ enum i8254_mode {
 #define NI_USUAL_RTSI_SELECT(x)	(((x) < 7) ? (0xb + (x)) : 0x1b)
 
 /* mode bits for NI general-purpose counters, set with
- * INSN_CONFIG_SET_COUNTER_MODE */
+ * INSN_CONFIG_SET_COUNTER_MODE
+ */
 #define NI_GPCT_COUNTING_MODE_SHIFT 16
 #define NI_GPCT_INDEX_PHASE_BITSHIFT 20
 #define NI_GPCT_COUNTING_DIRECTION_SHIFT 24
@@ -625,7 +630,8 @@ enum ni_gpct_mode_bits {
 };
 
 /* Bits for setting a clock source with
- * INSN_CONFIG_SET_CLOCK_SRC when using NI general-purpose counters. */
+ * INSN_CONFIG_SET_CLOCK_SRC when using NI general-purpose counters.
+ */
 enum ni_gpct_clock_source_bits {
 	NI_GPCT_CLOCK_SRC_SELECT_MASK = 0x3f,
 	NI_GPCT_TIMEBASE_1_CLOCK_SRC_BITS = 0x0,
@@ -657,8 +663,9 @@ enum ni_gpct_clock_source_bits {
 #define NI_GPCT_PFI_CLOCK_SRC_BITS(x)		(0x20 + (x))
 
 /* Possibilities for setting a gate source with
-INSN_CONFIG_SET_GATE_SRC when using NI general-purpose counters.
-May be bitwise-or'd with CR_EDGE or CR_INVERT. */
+ * INSN_CONFIG_SET_GATE_SRC when using NI general-purpose counters.
+ * May be bitwise-or'd with CR_EDGE or CR_INVERT.
+ */
 enum ni_gpct_gate_select {
 	/* m-series gates */
 	NI_GPCT_TIMESTAMP_MUX_GATE_SELECT = 0x0,
@@ -677,7 +684,8 @@ enum ni_gpct_gate_select {
 	NI_GPCT_SELECTED_GATE_GATE_SELECT = 0x21e,
 	/* m-series "second gate" sources are unknown,
 	 * we should add them here with an offset of 0x300 when
-	 * known. */
+	 * known.
+	 */
 	NI_GPCT_DISABLED_GATE_SELECT = 0x8000,
 };
 
@@ -687,7 +695,8 @@ enum ni_gpct_gate_select {
 #define NI_GPCT_UP_DOWN_PIN_GATE_SELECT(x)	(0x202 + (x))
 
 /* Possibilities for setting a source with
-INSN_CONFIG_SET_OTHER_SRC when using NI general-purpose counters. */
+ * INSN_CONFIG_SET_OTHER_SRC when using NI general-purpose counters.
+ */
 enum ni_gpct_other_index {
 	NI_GPCT_SOURCE_ENCODER_A,
 	NI_GPCT_SOURCE_ENCODER_B,
@@ -703,17 +712,20 @@ enum ni_gpct_other_select {
 #define NI_GPCT_PFI_OTHER_SELECT(x)	NI_USUAL_PFI_SELECT(x)
 
 /* start sources for ni general-purpose counters for use with
-INSN_CONFIG_ARM */
+ * INSN_CONFIG_ARM
+ */
 enum ni_gpct_arm_source {
 	NI_GPCT_ARM_IMMEDIATE = 0x0,
 	NI_GPCT_ARM_PAIRED_IMMEDIATE = 0x1, /* Start both the counter
 					     * and the adjacent paired
-					     * counter simultaneously */
+					     * counter simultaneously
+					     */
 	/* NI doesn't document bits for selecting hardware arm triggers.
 	 * If the NI_GPCT_ARM_UNKNOWN bit is set, we will pass the least
 	 * significant bits (3 bits for 660x or 5 bits for m-series)
 	 * through to the hardware.  This will at least allow someone to
-	 * figure out what the bits do later. */
+	 * figure out what the bits do later.
+	 */
 	NI_GPCT_ARM_UNKNOWN = 0x1000,
 };
 
@@ -729,7 +741,8 @@ enum ni_gpct_filter_select {
 };
 
 /* PFI digital filtering options for ni m-series for use with
- * INSN_CONFIG_FILTER. */
+ * INSN_CONFIG_FILTER.
+ */
 enum ni_pfi_filter_select {
 	NI_PFI_FILTER_OFF = 0x0,
 	NI_PFI_FILTER_125ns = 0x1,
@@ -741,7 +754,8 @@ enum ni_pfi_filter_select {
 enum ni_mio_clock_source {
 	NI_MIO_INTERNAL_CLOCK = 0,
 	NI_MIO_RTSI_CLOCK = 1,	/* doesn't work for m-series, use
-				   NI_MIO_PLL_RTSI_CLOCK() */
+				 * NI_MIO_PLL_RTSI_CLOCK()
+				 */
 	/* the NI_MIO_PLL_* sources are m-series only */
 	NI_MIO_PLL_PXI_STAR_TRIGGER_CLOCK = 2,
 	NI_MIO_PLL_PXI10_CLOCK = 3,
@@ -751,8 +765,9 @@ enum ni_mio_clock_source {
 #define NI_MIO_PLL_RTSI_CLOCK(x)	(NI_MIO_PLL_RTSI0_CLOCK + (x))
 
 /* Signals which can be routed to an NI RTSI pin with INSN_CONFIG_SET_ROUTING.
- The numbers assigned are not arbitrary, they correspond to the bits required
- to program the board. */
+ * The numbers assigned are not arbitrary, they correspond to the bits required
+ * to program the board.
+ */
 enum ni_rtsi_routing {
 	NI_RTSI_OUTPUT_ADR_START1 = 0,
 	NI_RTSI_OUTPUT_ADR_START2 = 1,
@@ -764,7 +779,8 @@ enum ni_rtsi_routing {
 	NI_RTSI_OUTPUT_RGOUT0 = 7,
 	NI_RTSI_OUTPUT_RTSI_BRD_0 = 8,
 	NI_RTSI_OUTPUT_RTSI_OSC = 12	/* pre-m-series always have RTSI
-					 * clock on line 7 */
+					 * clock on line 7
+					 */
 };
 
 #define NI_RTSI_OUTPUT_RTSI_BRD(x)	(NI_RTSI_OUTPUT_RTSI_BRD_0 + (x))
@@ -773,7 +789,8 @@ enum ni_rtsi_routing {
  * INSN_CONFIG_SET_ROUTING.  These numbers are also returned by
  * INSN_CONFIG_GET_ROUTING on pre-m-series boards, even though their routing
  * cannot be changed.  The numbers assigned are not arbitrary, they correspond
- * to the bits required to program the board. */
+ * to the bits required to program the board.
+ */
 enum ni_pfi_routing {
 	NI_PFI_OUTPUT_PFI_DEFAULT = 0,
 	NI_PFI_OUTPUT_AI_START1 = 1,
@@ -804,11 +821,12 @@ enum ni_pfi_routing {
 #define NI_PFI_OUTPUT_RTSI(x)		(NI_PFI_OUTPUT_RTSI0 + (x))
 
 /* Signals which can be routed to output on a NI PFI pin on a 660x board
- with INSN_CONFIG_SET_ROUTING.  The numbers assigned are
- not arbitrary, they correspond to the bits required
- to program the board.  Lines 0 to 7 can only be set to
- NI_660X_PFI_OUTPUT_DIO.  Lines 32 to 39 can only be set to
- NI_660X_PFI_OUTPUT_COUNTER. */
+ * with INSN_CONFIG_SET_ROUTING.  The numbers assigned are
+ * not arbitrary, they correspond to the bits required
+ * to program the board.  Lines 0 to 7 can only be set to
+ * NI_660X_PFI_OUTPUT_DIO.  Lines 32 to 39 can only be set to
+ * NI_660X_PFI_OUTPUT_COUNTER.
+ */
 enum ni_660x_pfi_routing {
 	NI_660X_PFI_OUTPUT_COUNTER = 1,	/* counter */
 	NI_660X_PFI_OUTPUT_DIO = 2,	/* static digital output */
@@ -816,7 +834,8 @@ enum ni_660x_pfi_routing {
 
 /* NI External Trigger lines.  These values are not arbitrary, but are related
  * to the bits required to program the board (offset by 1 for historical
- * reasons). */
+ * reasons).
+ */
 #define NI_EXT_PFI(x)			(NI_USUAL_PFI_SELECT(x) - 1)
 #define NI_EXT_RTSI(x)			(NI_USUAL_RTSI_SELECT(x) - 1)
 
@@ -829,7 +848,8 @@ enum comedi_counter_status_flags {
 
 /* Clock sources for CDIO subdevice on NI m-series boards.  Used as the
  * scan_begin_arg for a comedi_command. These sources may also be bitwise-or'd
- * with CR_INVERT to change polarity. */
+ * with CR_INVERT to change polarity.
+ */
 enum ni_m_series_cdio_scan_begin_src {
 	NI_CDIO_SCAN_BEGIN_SRC_GROUND = 0,
 	NI_CDIO_SCAN_BEGIN_SRC_AI_START = 18,
@@ -848,36 +868,41 @@ enum ni_m_series_cdio_scan_begin_src {
 
 /* scan_begin_src for scan_begin_arg==TRIG_EXT with analog output command on NI
  * boards.  These scan begin sources can also be bitwise-or'd with CR_INVERT to
- * change polarity. */
+ * change polarity.
+ */
 #define NI_AO_SCAN_BEGIN_SRC_PFI(x)	NI_USUAL_PFI_SELECT(x)
 #define NI_AO_SCAN_BEGIN_SRC_RTSI(x)	NI_USUAL_RTSI_SELECT(x)
 
 /* Bits for setting a clock source with
- * INSN_CONFIG_SET_CLOCK_SRC when using NI frequency output subdevice. */
+ * INSN_CONFIG_SET_CLOCK_SRC when using NI frequency output subdevice.
+ */
 enum ni_freq_out_clock_source_bits {
 	NI_FREQ_OUT_TIMEBASE_1_DIV_2_CLOCK_SRC,	/* 10 MHz */
 	NI_FREQ_OUT_TIMEBASE_2_CLOCK_SRC	/* 100 KHz */
 };
 
 /* Values for setting a clock source with INSN_CONFIG_SET_CLOCK_SRC for
- * 8254 counter subdevices on Amplicon DIO boards (amplc_dio200 driver). */
+ * 8254 counter subdevices on Amplicon DIO boards (amplc_dio200 driver).
+ */
 enum amplc_dio_clock_source {
 	AMPLC_DIO_CLK_CLKN,	/* per channel external clock
-				   input/output pin (pin is only an
-				   input when clock source set to this
-				   value, otherwise it is an output) */
+				 * input/output pin (pin is only an
+				 * input when clock source set to this
+				 * value, otherwise it is an output)
+				 */
 	AMPLC_DIO_CLK_10MHZ,	/* 10 MHz internal clock */
 	AMPLC_DIO_CLK_1MHZ,	/* 1 MHz internal clock */
 	AMPLC_DIO_CLK_100KHZ,	/* 100 kHz internal clock */
 	AMPLC_DIO_CLK_10KHZ,	/* 10 kHz internal clock */
 	AMPLC_DIO_CLK_1KHZ,	/* 1 kHz internal clock */
 	AMPLC_DIO_CLK_OUTNM1,	/* output of preceding counter channel
-				   (for channel 0, preceding counter
-				   channel is channel 2 on preceding
-				   counter subdevice, for first counter
-				   subdevice, preceding counter
-				   subdevice is the last counter
-				   subdevice) */
+				 * (for channel 0, preceding counter
+				 * channel is channel 2 on preceding
+				 * counter subdevice, for first counter
+				 * subdevice, preceding counter
+				 * subdevice is the last counter
+				 * subdevice)
+				 */
 	AMPLC_DIO_CLK_EXT,	/* per chip external input pin */
 	/* the following are "enhanced" clock sources for PCIe models */
 	AMPLC_DIO_CLK_VCC,	/* clock input HIGH */
@@ -887,7 +912,8 @@ enum amplc_dio_clock_source {
 };
 
 /* Values for setting a clock source with INSN_CONFIG_SET_CLOCK_SRC for
- * timer subdevice on some Amplicon DIO PCIe boards (amplc_dio200 driver). */
+ * timer subdevice on some Amplicon DIO PCIe boards (amplc_dio200 driver).
+ */
 enum amplc_dio_ts_clock_src {
 	AMPLC_DIO_TS_CLK_1GHZ,	/* 1 ns period with 20 ns granularity */
 	AMPLC_DIO_TS_CLK_1MHZ,	/* 1 us period */
@@ -895,18 +921,20 @@ enum amplc_dio_ts_clock_src {
 };
 
 /* Values for setting a gate source with INSN_CONFIG_SET_GATE_SRC for
- * 8254 counter subdevices on Amplicon DIO boards (amplc_dio200 driver). */
+ * 8254 counter subdevices on Amplicon DIO boards (amplc_dio200 driver).
+ */
 enum amplc_dio_gate_source {
 	AMPLC_DIO_GAT_VCC,	/* internal high logic level */
 	AMPLC_DIO_GAT_GND,	/* internal low logic level */
 	AMPLC_DIO_GAT_GATN,	/* per channel external gate input */
 	AMPLC_DIO_GAT_NOUTNM2,	/* negated output of counter channel
-				   minus 2 (for channels 0 or 1,
-				   channel minus 2 is channel 1 or 2 on
-				   the preceding counter subdevice, for
-				   the first counter subdevice the
-				   preceding counter subdevice is the
-				   last counter subdevice) */
+				 * minus 2 (for channels 0 or 1,
+				 * channel minus 2 is channel 1 or 2 on
+				 * the preceding counter subdevice, for
+				 * the first counter subdevice the
+				 * preceding counter subdevice is the
+				 * last counter subdevice)
+				 */
 	AMPLC_DIO_GAT_RESERVED4,
 	AMPLC_DIO_GAT_RESERVED5,
 	AMPLC_DIO_GAT_RESERVED6,
@@ -914,7 +942,8 @@ enum amplc_dio_gate_source {
 	/* the following are "enhanced" gate sources for PCIe models */
 	AMPLC_DIO_GAT_NGATN = 6, /* negated per channel gate input */
 	AMPLC_DIO_GAT_OUTNM2,	/* non-negated output of counter
-				   channel minus 2 */
+				 * channel minus 2
+				 */
 	AMPLC_DIO_GAT_PAT_PRESENT, /* "pattern present" signal */
 	AMPLC_DIO_GAT_PAT_OCCURRED, /* "pattern occurred" latched */
 	AMPLC_DIO_GAT_PAT_GONE,	/* "pattern gone away" latched */
diff --git a/drivers/staging/comedi/comedi_pcmcia.h b/drivers/staging/comedi/comedi_pcmcia.h
index 5d3db2b..5a572c2 100644
--- a/drivers/staging/comedi/comedi_pcmcia.h
+++ b/drivers/staging/comedi/comedi_pcmcia.h
@@ -39,7 +39,8 @@ void comedi_pcmcia_driver_unregister(struct comedi_driver *,
 				     struct pcmcia_driver *);
 
 /**
- * module_comedi_pcmcia_driver() - Helper macro for registering a comedi PCMCIA driver
+ * module_comedi_pcmcia_driver() - Helper macro for registering a comedi
+ * PCMCIA driver
  * @__comedi_driver: comedi_driver struct
  * @__pcmcia_driver: pcmcia_driver struct
  *
diff --git a/drivers/staging/comedi/comedilib.h b/drivers/staging/comedi/comedilib.h
index 56baf85..04e7711 100644
--- a/drivers/staging/comedi/comedilib.h
+++ b/drivers/staging/comedi/comedilib.h
@@ -1,20 +1,20 @@
 /*
-    linux/include/comedilib.h
-    header file for kcomedilib
+ *  linux/include/comedilib.h
+ *  header file for kcomedilib
 
-    COMEDI - Linux Control and Measurement Device Interface
-    Copyright (C) 1998-2001 David A. Schleef <ds-XoJnaB+qp91AfugRpC6u6w@public.gmane.org>
+ *  COMEDI - Linux Control and Measurement Device Interface
+ *  Copyright (C) 1998-2001 David A. Schleef <ds-XoJnaB+qp91AfugRpC6u6w@public.gmane.org>
 
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
 
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-*/
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ */
 
 #ifndef _LINUX_COMEDILIB_H
 #define _LINUX_COMEDILIB_H
-- 
2.1.0
