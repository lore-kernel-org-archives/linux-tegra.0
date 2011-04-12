From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/4] ASoC: Tegra: Rename harmony.c to tegra_wm8903.c
Date: Tue, 12 Apr 2011 12:01:35 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3EA4@HQMAIL01.nvidia.com>
References: <1302630039-19514-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302630039-19514-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org" <broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Tuesday, April 12, 2011 11:41 AM:
> Soon, this machine driver will be updated to handle a number of Tegra boards
> using the WM8903 codec. Rename the file in advance to reflect this.
> 
> Fix the content of tegra_wm8903.c to match the rename; replace references
> to Harmony board with something more generic.
> 
> * s/struct tegra_harmony/struct tegra_wm8903/
> * s/harmony/machine/ # variable name
> * Similar rename for some functions
> * Similar comment fix
> * Similar MODULE_DESCRIPTION fix
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I forgot to point out that this patch series depends on the series
"[PATCH 0/3] Rename Tegra ASoC driver" having been merged first.

-- 
nvpublic
