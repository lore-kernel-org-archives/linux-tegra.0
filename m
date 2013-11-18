From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/5] clk: tegra: add locking to periph clks
Date: Mon, 18 Nov 2013 16:11:37 +0100
Message-ID: <1384787499-26994-3-git-send-email-treding@nvidia.com>
References: <1384787499-26994-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384787499-26994-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra124 has periph clocks which share the hw register. Hence locking is
required.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra-periph.c | 36 +++++++++++++++++++++---------------
 drivers/clk/tegra/clk.h              | 10 ++++++----
 2 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 9125d0234e39..18509821fdc4 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -132,69 +132,75 @@
 			    _clk_num, _gate_flags, _clk_id)	\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			30, MASK(2), 0, 0, 8, 1, 0, \
-			_clk_num,  _gate_flags, _clk_id, _parents##_idx, 0)
+			_clk_num,  _gate_flags, _clk_id, _parents##_idx, 0, \
+			NULL)
 
 #define MUX_FLAGS(_name, _parents, _offset,\
 			    _clk_num, _gate_flags, _clk_id, flags)\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			30, MASK(2), 0, 0, 8, 1, 0, _clk_num,	\
-			_gate_flags, _clk_id, _parents##_idx, flags)
+			_gate_flags, _clk_id, _parents##_idx, flags, NULL)
 
 #define MUX8(_name, _parents, _offset, \
 			     _clk_num, _gate_flags, _clk_id)	\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			29, MASK(3), 0, 0, 8, 1, 0, _clk_num,	\
-			_gate_flags, _clk_id, _parents##_idx, 0)
+			_gate_flags, _clk_id, _parents##_idx, 0, NULL)
 
 #define INT(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			30, MASK(2), 0, 0, 8, 1, TEGRA_DIVIDER_INT,\
-			_clk_num, _gate_flags, _clk_id, _parents##_idx, 0)
+			_clk_num, _gate_flags, _clk_id, _parents##_idx, 0, \
+			NULL)
 
 #define INT_FLAGS(_name, _parents, _offset,\
 			    _clk_num, _gate_flags, _clk_id, flags)\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			30, MASK(2), 0, 0, 8, 1, TEGRA_DIVIDER_INT,\
-			_clk_num,  _gate_flags, _clk_id, _parents##_idx, flags)
+			_clk_num,  _gate_flags, _clk_id, _parents##_idx, \
+			flags, NULL)
 
 #define INT8(_name, _parents, _offset,\
 			    _clk_num, _gate_flags, _clk_id)	\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			29, MASK(3), 0, 0, 8, 1, TEGRA_DIVIDER_INT,\
-			_clk_num, _gate_flags, _clk_id, _parents##_idx, 0)
+			_clk_num, _gate_flags, _clk_id, _parents##_idx, 0, \
+			NULL)
 
 #define UART(_name, _parents, _offset,\
 			     _clk_num, _clk_id)			\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			30, MASK(2), 0, 0, 16, 1, TEGRA_DIVIDER_UART,\
-			_clk_num, 0, _clk_id, _parents##_idx, 0)
+			_clk_num, 0, _clk_id, _parents##_idx, 0, NULL)
 
 #define I2C(_name, _parents, _offset,\
 			     _clk_num, _clk_id)			\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			30, MASK(2), 0, 0, 16, 0, 0, _clk_num,	\
-			0, _clk_id, _parents##_idx, 0)
+			0, _clk_id, _parents##_idx, 0, NULL)
 
 #define XUSB(_name, _parents, _offset, \
 			     _clk_num, _gate_flags, _clk_id)	 \
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset, \
 			29, MASK(3), 0, 0, 8, 1, TEGRA_DIVIDER_INT,\
-			_clk_num, _gate_flags, _clk_id, _parents##_idx, 0)
+			_clk_num, _gate_flags, _clk_id, _parents##_idx, 0, \
+			NULL)
 
 #define AUDIO(_name, _offset,  _clk_num,\
 				 _gate_flags, _clk_id)		\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, mux_d_audio_clk,	\
 			_offset, 16, 0xE01F, 0, 0, 8, 1, 0, _clk_num, \
-			_gate_flags , _clk_id,	mux_d_audio_clk_idx, 0)
+			_gate_flags , _clk_id,	mux_d_audio_clk_idx, 0, \
+			NULL)
 
 #define NODIV(_name, _parents, _offset, \
 			      _mux_shift, _mux_mask, _clk_num, \
-			      _gate_flags, _clk_id)			\
+			      _gate_flags, _clk_id, _lock)		\
 	TEGRA_INIT_DATA_TABLE(_name, NULL, NULL, _parents, _offset,\
 			_mux_shift, _mux_mask, 0, 0, 0, 0, 0,\
 			_clk_num, (_gate_flags) | TEGRA_PERIPH_NO_DIV,\
-			_clk_id, _parents##_idx, 0)
+			_clk_id, _parents##_idx, 0, _lock)
 
 #define GATE(_name, _parent_name,	\
 			     _clk_num, _gate_flags,  _clk_id, _flags)	\
@@ -203,7 +209,7 @@
 		.clk_id = _clk_id,					\
 		.p.parent_name = _parent_name,				\
 		.periph = TEGRA_CLK_PERIPH(0, 0, 0, 0, 0, 0, 0,		\
-				_clk_num, _gate_flags, 0),		\
+				_clk_num, _gate_flags, 0, NULL),	\
 		.flags = _flags						\
 	}
 
@@ -456,8 +462,8 @@ static struct tegra_periph_init_data periph_clks[] = {
 	MUX8("clk72mhz", mux_pllp3_pllc_clkm, CLK_SOURCE_CLK72MHZ, 177, TEGRA_PERIPH_NO_RESET, tegra_clk_clk72Mhz),
 	MUX8("sor0", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_SOR0, 182, 0, tegra_clk_sor0),
 	MUX_FLAGS("csite", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_CSITE, 73, TEGRA_PERIPH_ON_APB, tegra_clk_csite, CLK_IGNORE_UNUSED),
-	NODIV("disp1", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP1, 29, 7, 27, 0, tegra_clk_disp1),
-	NODIV("disp2", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP2, 29, 7, 26, 0, tegra_clk_disp2),
+	NODIV("disp1", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP1, 29, 7, 27, 0, tegra_clk_disp1, NULL),
+	NODIV("disp2", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK_SOURCE_DISP2, 29, 7, 26, 0, tegra_clk_disp2, NULL),
 	UART("uarta", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTA, 6, tegra_clk_uarta),
 	UART("uartb", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTB, 7, tegra_clk_uartb),
 	UART("uartc", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTC, 55, tegra_clk_uartc),
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 7f110acfe2a1..f984ebed9f1f 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -439,19 +439,21 @@ struct clk *tegra_clk_register_periph_nodiv(const char *name,
 #define TEGRA_CLK_PERIPH(_mux_shift, _mux_mask, _mux_flags,		\
 			 _div_shift, _div_width, _div_frac_width,	\
 			 _div_flags, _clk_num,\
-			 _gate_flags, _table)				\
+			 _gate_flags, _table, _lock)			\
 	{								\
 		.mux = {						\
 			.flags = _mux_flags,				\
 			.shift = _mux_shift,				\
 			.mask = _mux_mask,				\
 			.table = _table,				\
+			.lock = _lock,					\
 		},							\
 		.divider = {						\
 			.flags = _div_flags,				\
 			.shift = _div_shift,				\
 			.width = _div_width,				\
 			.frac_width = _div_frac_width,			\
+			.lock = _lock,					\
 		},							\
 		.gate = {						\
 			.flags = _gate_flags,				\
@@ -481,7 +483,7 @@ struct tegra_periph_init_data {
 			_mux_shift, _mux_mask, _mux_flags, _div_shift,	\
 			_div_width, _div_frac_width, _div_flags,	\
 			_clk_num, _gate_flags, _clk_id, _table,		\
-			_flags) \
+			_flags, _lock) \
 	{								\
 		.name = _name,						\
 		.clk_id = _clk_id,					\
@@ -491,7 +493,7 @@ struct tegra_periph_init_data {
 					   _mux_flags, _div_shift,	\
 					   _div_width, _div_frac_width,	\
 					   _div_flags, _clk_num,	\
-					   _gate_flags, _table),	\
+					   _gate_flags, _table, _lock),	\
 		.offset = _offset,					\
 		.con_id = _con_id,					\
 		.dev_id = _dev_id,					\
@@ -506,7 +508,7 @@ struct tegra_periph_init_data {
 			_mux_shift, BIT(_mux_width) - 1, _mux_flags,	\
 			_div_shift, _div_width, _div_frac_width, _div_flags, \
 			_clk_num, _gate_flags, _clk_id,\
-			NULL, 0)
+			NULL, 0, NULL)
 
 /**
  * struct clk_super_mux - super clock
-- 
1.8.4.2
