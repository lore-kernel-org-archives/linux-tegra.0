From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: roth: add display DT node
Date: Tue, 22 Jul 2014 13:39:51 +0900
Message-ID: <CAAVeFuKtVYNP5LFXGCEpkUtCCrK6AP+9WEVPDPs45RwAPvKKRg@mail.gmail.com>
References: <1404303560-32209-1-git-send-email-acourbot@nvidia.com>
 <1404303560-32209-5-git-send-email-acourbot@nvidia.com> <53B42B60.1000600@wwwdotorg.org>
 <53B4C9C0.4000605@nvidia.com> <53CD333F.2070805@wwwdotorg.org>
 <20140721211630.GA12076@mithrandir> <20140721225153.GJ17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140721225153.GJ17528-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 22, 2014 at 7:51 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Jul 21, 2014 at 11:16:32PM +0200, Thierry Reding wrote:
>> On Mon, Jul 21, 2014 at 09:35:27AM -0600, Stephen Warren wrote:
>
>> > > vdd-2v8-display needs to remain always-on however. Here we may hit a
>> > > limitation of the simple-panel driver, where only one power supply can
>> > > be provided.
>
>> > Can't we fix the simple-panel driver to allow a list of regulators in
>> > the property?
>
>> I have no objection to allowing that. But I don't think there's a way to
>> do that with the current regulator API. You can use the bulk API, but
>> that requires separate properties, not multiple regulators in one
>> property.
>
>> Perhaps one idea to solve this would be to make the regulator API return
>> a regulator handle that in fact controls an array of regulators? Adding
>> Mark.
>
> I'm really not comfortable with that idea, it seems like most of the
> users would be abusing it - one of the biggest issues is always getting
> people to understand that their driver may be used in other systems with
> the supplies mapped differently.  If you were going to do something
> along those lines you'd need to do something that enumerated all the
> supply properties on the device.

I also don't think that would do it - for many displays the power-on
sequence is not as simple as "switch all the regulators on".

Maybe what we would want is to have panel-simple allow panels to
provide a "probe" callback so they can request and manage any extra
resource they need. This would of course imply that custom
enable/disable and suspend/resume callbacks. Then the driver might not
be "simple" anymore, but IMHO it would not be that bad.
