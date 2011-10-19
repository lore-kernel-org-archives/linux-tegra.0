From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: paz00: Fix board pinmux table.
Date: Wed, 19 Oct 2011 08:18:52 -0700
Message-ID: <CAOesGMh9502kSvu_Q9XnsFzYMYnQpMvoFM87_VUEhC+Rknt1dQ@mail.gmail.com>
References: <1318691913-9597-1-git-send-email-leon@leon.nu>
	<201110151834.22732.marvin24@gmx.de>
	<74CDBE0F657A3D45AFBB94109FB122FF173BE1A4A4@HQMAIL01.nvidia.com>
	<9849440.cSOtOCBmUT@ax5200p>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CB3B@HQMAIL01.nvidia.com>
	<CALq1K=JhD-igHv=yN+kg-Q+3j7TTPxyigC9de95T0xcV8VXWrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALq1K=JhD-igHv=yN+kg-Q+3j7TTPxyigC9de95T0xcV8VXWrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Wed, Oct 19, 2011 at 4:29 AM, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org> wrote:
> On Tue, Oct 18, 2011 at 18:10, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Marc Dietrich wrote at Tuesday, October 18, 2011 9:50 AM:
>>> On Monday 17 October 2011 08:29:01 Stephen Warren wrote:
>>> > Marc Dietrich wrote at Saturday, October 15, 2011 10:34 AM:
>>> > > Am Samstag 15 Oktober 2011, 17:18:33 schrieb Leon Romanovsky:
>>> > > > This fix updates the CDEV1 pinmux for the paz00 board to be as in the
>>> > > > Harmony board. Paz00 board is originally based on Harmony design.
>>> > >
>>> > > the fact that this patch makes sound work on paz00 does not necessary mean
>>> > > that this is the "right thing" to do.
>>> > None of the other boards do that, and the drivers don't support it. I
>>> > believe the clock would need to be started as soon as the audio driver
>>> > module were loaded, and kept running as long as it was loaded, so there's
>>> > not much chance of optimizing power here at the moment.
>>>
>>> Which driver?
>>
>> The whole ASoC driver stack. It may depend on the codec, but I assume that
>> CDEV1 clock output should be running the whole time the ASoC codec driver
>> is active. Alsa-devel would be the best place to ask about that kind of
>> thing.
>
> Let's summarize, we agree that it is a correct way to handle CDEV1,
> and it is a correct patch.
> I believe it is a good time to merge the patch before we start to
> merge the codec itself.

It'll be staged for 3.3 when I start those branches, which should be soon.

We're close to the merge window, it's not a regression fix and you
need other changes on top of it anyway to get anything useful out of
it -- so it can wait.

Thank you for posting it early though, and I'll make sure it makes it
into linux-next quickly so you can use that as a base for your codec
work.


-Olof
