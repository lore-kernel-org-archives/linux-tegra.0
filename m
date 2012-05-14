From: "Turquette, Mike" <mturquette-l0cyMroinI0@public.gmane.org>
Subject: Re: moving Tegra30 to the common clock framework
Date: Mon, 14 May 2012 14:36:34 -0700
Message-ID: <20120514213634.GA3075@gmail.com>
References: <20120503161311.GG20304@tbergstrom-lnx.Nvidia.com>
 <20120507000329.GB14559@gmail.com>
 <4FA7ECAA.1040104@wwwdotorg.org>
 <CAJOA=zNKDFPOQ9-0EuEy=dtq=g-CKFBq94enTuoB7wVPskbkMg@mail.gmail.com>
 <CAAXpJNsJiT7s87p6jS5bdi-83n4bwSaagdSK0w3SbrVz+k+O0g@mail.gmail.com>
 <CAJOA=zP4iEZ+CFfCjT1rgU6shOt_PUf2BRB76NEQCoUPZJ9hVg@mail.gmail.com>
 <4FA9BD41.2090701@codeaurora.org>
 <20120509103606.GY20304@tbergstrom-lnx.Nvidia.com>
 <4FADD1EA.8090606@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FADD1EA.8090606-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Saravana Kannan <skannan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, zhoujie wu <zhoujiewu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 11, 2012 at 7:58 PM, Saravana Kannan <skannan-sgV2jX0FEOJiIJoWrK/4GQ@public.gmane.org=
g> wrote:
> Mike,
>
> I was looking at the code to make the changes and I noticed this snip=
pet
> (reformatted for email) in clk_change_rate():
>
> =A0 =A0 =A0 if (clk->ops->set_rate)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk->ops->set_rate(clk->hw, clk->new_r=
ate,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0clk->parent->rate);
>
>
> =A0 =A0 =A0 =A0if (clk->ops->recalc_rate)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk->rate =3D clk->ops->recalc_rate(cl=
k->hw,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk->p=
arent->rate);
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk->rate =3D clk->parent->rate;
>
> I'm a bit confused. I thought recalc_rates was optional. But if I don=
't
> implement it, the clocks rate will get set to parent's rate? Or is th=
at a
> bug in the code?
>

It is not a bug.  The handsome ascii art in Documentation/clk.txt cover=
s
this requirement.  I have copy/pasted the relevant bits below for
convenience:

                           clock hardware characteristics
	     -----------------------------------------------------------
             | gate | change rate | single parent | multiplexer | root =
|
             |------|-------------|---------------|-------------|------=
|
	     				...
             |      |             |               |             |      =
|
=2Erecalc_rate |      | y           |               |             |    =
  |
=2Eround_rate  |      | y           |               |             |    =
  |
=2Eset_rate    |      | y           |               |             |    =
  |
					...
             |      |             |               |             |      =
|
	     -----------------------------------------------------------

The take-away is that a clock that can adjust its rate (eg: implements =
a
=2Eset_rate callback) must also implement .recalc_rate and .round_rate
callbacks.

> Also, if the clock's rate was just set with set_rate, why do we need =
to
> recalc the rate by reading hardware? I'm a bit confused. Can you plea=
se
> clarify what's going on here?
>

This is simply being very cautious.  For platforms adjusting dividers
with direct register writes this might feel unnecessary.  However this
strict checking is in anticipation of clock hardware that might not
actually output the precise rate passed into .set_rate.  In principal
this isn't different from how CPUfreq and devfreq drivers inspect rates
after requesting them.

> Would you mind adding more comments inside clk_calc_new_rates() and
> clk_change_rate() trying to explain what cases you are trying to acco=
unt
> for?
>

Someday I'll have a comment/kerneldoc cleanup session.  Things in the
clock core are likely to change in the next couple of release cycles
which will deprecate some of the kerneldoc making a big cleanup
unavoidable.

In the mean time are there any other specific question you have for
clk_change_rate?

> Also, in clk_calc_new_rates(),
>
> =A0 =A0 =A0 =A0if (!clk->ops->round_rate) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0top =3D clk_calc_new_rates(clk->parent=
, rate);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0new_rate =3D clk->parent->new_rate;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> =A0 =A0 =A0 =A0}
>
> Is the code assuming that if there is no round rate ops that that clo=
ck node
> is only a gating clock (as in, can't change frequency the input freq)=
? Just
> trying to understand the assumptions made in the code.
>

This is also covered by the ascii art above.  There is no assumption
about gating, per se.  However if a clock can adjust it's rate (more
specifically, if the input rate for a clock differs from the output
rate) then a .round_rate callback must exist.

The code above reads like it does because in the absence of a
=2Eround_rate callback it is implied that the clock cannot set it's own
rate and should thus rely on its parent's rate.

Regards,
Mike

>
> Thanks,
> Saravana
>
> --
> Sent by an employee of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora F=
orum.
