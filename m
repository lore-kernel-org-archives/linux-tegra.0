From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] gpu: host1x: clk_round_rate() can return a zero upon error
Date: Mon, 9 Dec 2013 18:00:12 -0800
Message-ID: <alpine.DEB.2.02.1312091746400.4127@tamien>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-669180444-1386640819=:4127"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?ISO-8859-15?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--8323329-669180444-1386640819=:4127
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT


Treat both negative and zero return values from clk_round_rate() as
errors.  This is needed since subsequent patches will convert
clk_round_rate()'s return value to be an unsigned type, rather than a
signed type, since some clock sources can generate rates higher than
(2^31)-1 Hz.

Eventually, when calling clk_round_rate(), only a return value of zero
will be considered a error.  All other values will be considered valid
rates.  The comparison against values less than 0 is kept to preserve
the correct behavior in the meantime.

Signed-off-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje Bergström <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Applies on v3.13-rc3.  See also:

http://marc.info/?l=linux-arm-kernel&m=138542591313620&w=2

  drivers/gpu/drm/tegra/hdmi.c |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 0cd9bc2056e8..8cf9d3aeb0cd 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -959,7 +959,7 @@ static int tegra_output_hdmi_check_mode(struct tegra_output *output,
  	parent = clk_get_parent(hdmi->clk_parent);

  	err = clk_round_rate(parent, pclk * 4);
-	if (err < 0)
+	if (err <= 0)
  		*status = MODE_NOCLOCK;
  	else
  		*status = MODE_OK;
--8323329-669180444-1386640819=:4127--
