From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 3/6] drm: tegra: protect DC register access with mutex
Date: Thu, 20 Dec 2012 09:28:25 +0100
Message-ID: <1355992105.1490.79.camel@tellur>
References: <1355953137-31563-1-git-send-email-dev@lynxeye.de>
	 <1355953137-31563-4-git-send-email-dev@lynxeye.de>
	 <50D2799F.4010008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D2799F.4010008-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Donnerstag, den 20.12.2012, 10:36 +0800 schrieb Mark Zhang:
> OK, you add a mutex in a tegra_dc structure. But I think there is no
> parallel scenario while we operate on a dc. AFAIK, the functions which
> you add mutex protection are called by drm sequentially(except for
> function "tegra_crtc_load_lut" I'm not very clear about that).
> 
> So could you give us an example?
> 
You are right, I looked this up again. I thought cursor actions are
async to other modeset actions, but in fact they are also protected by
the mode_config.mutex. So really no need to have another mutex in our dc
code.

Sorry for the noise.

Lucas
