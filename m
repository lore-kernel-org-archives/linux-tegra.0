From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 4/5] drm/tegra: Implement VBLANK support
Date: Mon, 11 Feb 2013 07:43:20 -0800
Message-ID: <51191198.7020303@nvidia.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de> <1358179560-26799-5-git-send-email-thierry.reding@avionic-design.de> <50FECE63.7090009@tuebingen.mpg.de> <1358879999.1540.22.camel@tellur> <CADWT_cOjVg9-hB+jWuEUr+Ou-YECBN73WQXNy17qXf3TO1ZjpQ@mail.gmail.com> <50FEEF92.9060009@tuebingen.mpg.de> <50FF990C.3040902@nvidia.com> <20130211090840.GB3423@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130211090840.GB3423-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>, Jon Mayo <jon-MQ+mZzckBGs@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11.02.2013 01:08, Thierry Reding wrote:
> Are the syncpoints incremented even if the VBLANK interrupts are turned
> off? If that's the case they could indeed be used as a hardware counter
> rather than the fake approach used right now.
> 
> Maybe we should leave the code as it is right now and fix that up once
> the syncpoint support has been merged.

Yes, the sync point increment signal to host1x is independent of VBLANK
interrupt.

Definitely not needed yet, so that was a comment for future improvement.

Terje
