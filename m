From: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Subject: Re: DRM_TEGRA not buildable as a module
Date: Mon, 18 Nov 2013 07:40:46 -0500
Message-ID: <CA+5PVA7iAR6B=NkuJ8f+FZdWKJ8AskBG5Pc+rWiQZUttO99BxQ@mail.gmail.com>
References: <CA+5PVA7hq9e2twtQ2e24VvF+KHJ_XS4uVskWRQo+g7z3VpmKXw@mail.gmail.com>
	<20131118091042.GB13322@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131118091042.GB13322-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 18, 2013 at 4:10 AM, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Sat, Nov 16, 2013 at 03:25:09PM +0100, Josh Boyer wrote:
>> Hi All,
>>
>> The commit below seems to have made the Tegra DRM driver a bool option
>> instead of tristate:
>>
>> commit dee8268f8fb218c9e9b604a40f7dbdd395e910f9
>> Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Date:   Wed Oct 9 10:32:49 2013 +0200
>>
>>     drm/tegra: Move driver to DRM tree
>>
>>     In order to make subsystem-wide changes easier, move the Tegra DRM
>>     driver back into the DRM tree.
>>
>>     Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> That means you can't build the driver as a module.  Was this intended?
>>  The changelog doesn't mention anything about that and the existing
>> help text on the option seems to imply it should be buildable as a
>> module.
>
> This was intended yes. And it wasn't really a change at all, since prior
> to the commit you mention above the DRM driver was always built into the
> host1x driver. That's why I didn't think it necessary to mention it in
> the commit message.
>
> I have some patches queued for 3.14 to enable the driver to be built as
> a module. There are some dependencies such as symbols that need to be
> exported so that the modules can be linked, so it'll require some amount
> of coordination to make that work out within one release cycle, but I'm
> hopeful that we can do it.

OK.  Thanks for the detailed reply.

josh
