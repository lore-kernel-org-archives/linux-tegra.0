From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Naming convention DSI + device tree
Date: Fri, 17 May 2013 13:39:00 -0600
Message-ID: <51968754.6050509@wwwdotorg.org>
References: <20130514181745.GA2762@mail.o2s.ch> <51940C22.4050802@wwwdotorg.org> <20130516071537.GA13573@mail.o2s.ch> <519522C1.5010107@wwwdotorg.org> <5195C1E2.4020009@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5195C1E2.4020009-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: =?ISO-8859-1?Q?David_Lanzend=F6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/16/2013 11:36 PM, Alex Courbot wrote:
...
> I checked whether the rebase worked and it does - you just need to
> enable host1x/tegradrm support on top of the default settings (Stephen,
> why aren't these enabled by default?)

I guess it just got overlooked. I see CONFIG_DRM is on though; perhaps
the default for the Tegra DRM driver changed in Kconfig. Feel free to
send a patch to tegra_defconfig.
