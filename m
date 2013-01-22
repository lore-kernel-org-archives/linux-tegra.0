From: Jon Mayo <jon-MQ+mZzckBGs@public.gmane.org>
Subject: Re: [PATCH 4/5] drm/tegra: Implement VBLANK support
Date: Tue, 22 Jan 2013 10:21:40 -0800
Message-ID: <CADWT_cPtdmSF+_ybe70ZY_z5idzr0KQe94r57ok-Hf-V22wixA@mail.gmail.com>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
	<1358178932-25505-5-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358178932-25505-5-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 14, 2013 at 7:55 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> Implement support for the VBLANK IOCTL. Note that Tegra is somewhat
> special in this case because it doesn't use the generic IRQ support
> provided by the DRM core (DRIVER_HAVE_IRQ) but rather registers one
> interrupt handler for each display controller.
>
> While at it, clean up the way that interrupts are enabled to ensure
> that the VBLANK interrupt only gets enabled when required.
>
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---

Sorry Thierry, but is this a useful feature? Are applications really
making use of it? Because it means that that an IRQ will have to
trigger every 16.67ms when it is taken, which means the device can't
sleep. (probably OK because it should go back to idle when the app
lets go of the vblank). But worse, for one-shot panels there is no
continuous vblank. I've been doing weird hacks to run a timer when the
smart panel is idle to trick applications into thinking they have a
vblank pulse. But really I think the whole feature of a vblank pulse
is pretty lame and I wish it would die. Were you going to use it for
something specific, or just adding it for completeness?

- Jon
