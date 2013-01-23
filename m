From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 4/5] drm/tegra: Implement VBLANK support
Date: Wed, 23 Jan 2013 10:02:20 +0200
Message-ID: <50FF990C.3040902@nvidia.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-5-git-send-email-thierry.reding@avionic-design.de> <50FECE63.7090009@tuebingen.mpg.de> <1358879999.1540.22.camel@tellur> <CADWT_cOjVg9-hB+jWuEUr+Ou-YECBN73WQXNy17qXf3TO1ZjpQ@mail.gmail.com> <50FEEF92.9060009@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50FEEF92.9060009-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: Jon Mayo <jon-MQ+mZzckBGs@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 22.01.2013 21:59, Mario Kleiner wrote:
> The current swap scheduling is based on having an accurate software 
> vblank counter. Atm. that counter is maintained in software, incremented 
> during vblank irq. At irq off -> on transition we need a hw counter to 
> reinitialize. And there is a timeout between dropping the last reference 
> to a counter via drm_vblank_put() and actually disabling the vblank irq. 
> If the timeout is long enough and a timing sensitive app is aware that 
> vblank counters may be inaccurate/unreliable over long time periods, it 
> can work around the problem.

We have a hardware counter that can be used as VBLANK counter - host1x
sync point register numbers 26 and 27. tegradrm already sets them up in
dc init (DC_CMD_CONT_SYNCPT_VSYNC). Basic syncpt support (read, wait) is
part of my patch set to implement 2D acceleration.

Terje
