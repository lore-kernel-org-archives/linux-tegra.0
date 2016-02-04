From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 3/4] sound/soc: tegra_max98090: document headphone jack rename
Date: Thu, 4 Feb 2016 11:22:52 -0800
Message-ID: <CAEUnVG6DhFNcg64wKwbusxL=O_LBybv3wzFCjX+6vzLNFzuEDw@mail.gmail.com>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
 <1454563862-1971-4-git-send-email-sctincman@gmail.com> <56B37EAC.5010101@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B37EAC.5010101-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 4, 2016 at 8:39 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 02/03/2016 10:31 PM, Jonathan Tinkham wrote:
>>
>> Update device-tree bindings to reflect the rename of the board's
>> headphone jack.
>
>
> This looks like an incompatible change to the DT. While you've fixed the DT,
> which will fix new installations, old DTs now won't work. This breaks DT
> ABI. Any DT change needs to be backwards compatible, i.e. the old name
> should still work and be documented as a legacy value.
>

These values are also present in the UCM config for the boards present
in alsa-lib/conf/ucm/GoogleNyan

It's better not to rely on drivers using a "standard" name, better to
let the UCM file abstract it away.
