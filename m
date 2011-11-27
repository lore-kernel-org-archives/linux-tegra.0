From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: DT DMA channel binding for Tegra I2S
Date: Sun, 27 Nov 2011 12:02:02 +0000
Message-ID: <20111127120202.GI2896@opensource.wolfsonmicro.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF174F08C803@HQMAIL01.nvidia.com>
 <4ECD6BA4.1010607@gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174F08C881@HQMAIL01.nvidia.com>
 <CAL_JsqLk=ExaPoy9f3CqEthjZsu7CVmAwcckpk5PyJA-NhMGVA@mail.gmail.com>
 <20111125160908.GF5315@opensource.wolfsonmicro.com>
 <4ED1B765.9070107@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4ED1B765.9070107-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Nov 26, 2011 at 10:07:01PM -0600, Rob Herring wrote:
> On 11/25/2011 10:09 AM, Mark Brown wrote:
> > On Fri, Nov 25, 2011 at 09:55:23AM -0600, Rob Herring wrote:

> >> Although, I think you are possibly missing some other properties for
> >> i2s mode like word size and master/slave mode. I think the ideal case
> >> is that a single ASoC platform driver for DT could handle multiple
> >> SoCs.

> > No.  You're not going to be able to get a single binding which handles
> > the setup for all systems based off a given SoC let alone multiple SoCs.
> > It is possible to come up with some subsets which work over multiple
> > boards but that's going to be outside the binding for the I2S controller
> > and in a board audio hardware binding for the subset.

> I never said a single binding. Part of device tree is describing how
> devices are connected together which is a large part of the audio
> configuration. Whether there's one common driver or not doesn't really
> matter. The important part right now is to define the bindings and do so
> in a common way where possible.

That's what I'm hearing when I hear you talk about things like defining
a binding that works for multiple SoCs or which defines stuff like word
size and master/slave mode (word size especially needs to be a runtime
property).

> My original point really was that when defining a binding, it should be
> as complete as possible rather than done incrementally over time. You
> are describing the h/w, and that's not changing. For an i2s block, only
> having a dma channel is definitely not complete.

The binding posted had DMA, registers and IRQ which seems like exactly
what I'd expect for an I2S controller - the reason only DMA was being
highlighted is that that's the only bit with a lack of clarity on the
bindings.

> > This has been discussed repeatedly, we really need to work out how to
> > educate device tree people about this stuff, it gets *very* repetitive
> > having the discussion over and over again.

> As you might guess, audio is not an area I have been spending time on
> recently. Perhaps seeing a complete binding with all the pieces (codec,
> i2s, misc gpio's, etc.) would help educate us.

Stephen's patches are the closest I've seen yet to what's been decided.

This is exactly the sort of concern I have with education - we've been
through this discussion repeatedly and yet every time a new person from
the OF side turns up we have to go through the same explanations and
discussion again.  Like I say this really does get very repetitive.
