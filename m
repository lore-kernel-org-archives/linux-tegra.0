From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ASoC: Tegra: sparse cleanup
Date: Fri, 14 Oct 2011 15:59:31 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A3ED@HQMAIL01.nvidia.com>
References: <1318632859-14796-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318632859-14796-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Friday, October 14, 2011 4:54 PM:
> Fixes the following sparse warnings:
> 
> sound/soc/tegra/tegra_das.c:215:8: warning: Using plain integer as NULL pointer
> sound/soc/tegra/tegra_das.c:237:8: warning: Using plain integer as NULL pointer
> sound/soc/tegra/tegra_pcm.c:370:32: warning: symbol 'tegra_pcm_platform' was not declared. Should it
> be static?
> 
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Grumble, in C++ 0==NULL... :-)

-- 
nvpublic
