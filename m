From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3] ASoC: tegra: TrimSlice machine support
Date: Tue, 26 Apr 2011 08:18:53 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04973BBCA5@HQMAIL01.nvidia.com>
References: <1303807962-14833-1-git-send-email-mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303807962-14833-1-git-send-email-mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mike Rapoport wrote at Tuesday, April 26, 2011 2:53 AM:
> Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> ---
> v3 changes:
> * s/SND_TEGRA_SOC/SND_SOC_TEGRA
> * drop 'default' setting in Kconfig
> 
> v2 changes:
> * address Stephen and Mark comments
> * rebase against Mark's for-next branch
> * switch to data based specification of widgets and routes
> * explicitly disable unused codec pins

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

P.S. Sorry for not thinking straight about the for-2.6.40/for-next thing;
I was thrown off by the differing Kconfig variable names and then worked
back to the wrong conclusion.

P.P.S. My TrimSlice arrived yesterday. Hopefully I'll have a chance to
try out this new driver soon.

-- 
nvpublic
