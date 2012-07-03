From: "Turquette, Mike" <mturquette-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: tegra: Add clk_tegra structure and helper functions
Date: Mon, 2 Jul 2012 17:09:28 -0700
Message-ID: <CAJOA=zMt-HWKrgQ-pD-wH0s_Nao5sJA13+ESJSBkHQ_3OBurtg@mail.gmail.com>
References: <1340879846-12900-1-git-send-email-pgaikwad@nvidia.com>
 <1340879846-12900-5-git-send-email-pgaikwad@nvidia.com> <20120628182759.GA28424@gmail.com>
 <4FED688E.9090408@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FED688E.9090408-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 29, 2012 at 1:34 AM, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
> On Thursday 28 June 2012 11:58 PM, Mike Turquette wrote:
>> We had some discussions in the past on your clock reset and external
>> line request operations which you've had to put into struct clk_tegr=
a.
>>
>> Do you need to expose those ops to code in drivers/*? =A0I consider =
that a
>> reasonable litmus test to start considering if something should be m=
oved
>> into the generic clk.h api.
>
>
> Yes, we need these ops in drivers. Peter has sent a patch proposing t=
o move
> these ops to generic clk.
>
> In addition, we also need mechanism/ops to change rate and parent fro=
m
> clk_ops implementation. There was some discussion but I do not know t=
he
> latest status.
>

Hi Prashant,

OK, that is good to know.  I haven't forgotten about this topic.  I'm
still trying to think of the best way to expose less-common operations
to drivers...

Based on Stephen's feedback in patch 0 I'll be waiting for another
version of this series before taking into clk-next.

Thanks,
Mike
