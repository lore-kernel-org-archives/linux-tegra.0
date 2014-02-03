From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 00/16] drm/nouveau: initial support for GK20A (Tegra K1)
Date: Mon, 3 Feb 2014 13:41:27 +1000
Message-ID: <CACAvsv6TpyWsKfg0Y9Mjn_TDOWw6yzD_5vfCfycgLnPwU5_ccA@mail.gmail.com>
References: <1391224618-3794-1-git-send-email-acourbot@nvidia.com>
	<CAKb7Uvg4Bqy1tHetVZBe=aekFDbgrGygc-evnSXxsoGqgoTA8A@mail.gmail.com>
	<52EF0294.2090103@nvidia.com>
	<CAKb7UvgSpy7wwpg+Fb8V678DvkrqGdcuciTF136VcktJb9-Wiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKb7UvgSpy7wwpg+Fb8V678DvkrqGdcuciTF136VcktJb9-Wiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 3, 2014 at 1:14 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> On Sun, Feb 2, 2014 at 9:44 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> One beginner question: is it appropriate to send kernel patches to the
>> nouveau list in addition to dri-devel? The moderation messages I receive
>> make me think that this list might rather be intended for general
>> discussion.
>
> I usually do. The main thing is to make sure that they're To: Ben,
> since he's the one who will be ultimately be picking them up. I think
> that if you're not subscribed, all the lists.freedesktop.org lists
> moderate you, but dri-devel is configured not to tell you about it.
> Also I've been getting bounce messages from nouveau@ complaining of
> too many cc's and so it's getting auto-moderated -- not sure who, if
> anyone, is an admin of the nouveau list. Hopefully someone :)
The Nouveau list seems the most appropriate.  There's not really any
need to explicitly CC me either, I do watch the list :)

>
>   -ilia
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
