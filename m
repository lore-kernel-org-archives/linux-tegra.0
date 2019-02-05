From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] reset: Don't WARN if trying to get a used reset control
Date: Tue, 05 Feb 2019 19:05:41 +0100
Message-ID: <1549389941.3929.14.camel@pengutronix.de>
References: <20190125101554.5947-1-thierry.reding@gmail.com>
         <1548674808.6421.3.camel@pengutronix.de> <20190128145836.GA31317@ulmo>
         <1548849808.3939.7.camel@pengutronix.de> <20190201140025.GB12829@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201140025.GB12829@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Fri, 2019-02-01 at 15:00 +0100, Thierry Reding wrote:
[...]
> It sounds pretty good and elegant actually. Let me try to restate to see
> if I understand correctly:
> 
> So basically what you're saying is that we would be changing the
> definition of exclusive resets to make them exclusive in terms of usage
> rather than rejecting to acquire them multiple times, right? So we would
> reinstate the possibility to request exclusive resets from multiple
> sources, but add an _acquire()/_release() protocol to make sure the
> users don't get in each other's way.

Yes. Though drivers currently expect that reset_control_get_exclusive
returns 'acquired' reset lines, so that has to stay. This method should
continue to fail if the same reset line is already acquired somewhere
else.

There could be a new request method (for lack of a better idea,
for example: reset_control_get_exclusive_released) to request an
initially released reset control. That method would not fail if the same
reset line is already requested and acquired elsewhere.

> I had initially thought that this would have to be some other type of
> reset (something between exclusive and shared) to avoid suprising the
> current users of exclusive resets. However, on second thought, I don't
> think that would be necessary. Given the WARN_ON, all users of exclusive
> resets should at this point be truly exclusive and would therefore
> continue to work normally.

I agree. But there must be no changes in behaviour for drivers that keep
requesting exclusive resets and never all _acquire()/_release().

> One problematic case that comes to mind is how currently exclusive reset
> controls will know that reset_control_assert() is safe to use if they
> don't use reset_control_acquire() first.

Drivers that never call _acquire()/_release() must continue to work as
they are, so exclusive reset controls have to be acquired by default.

> Perhaps this is what you meant when you said:
>
> > That would also mean we'd have to add a way for the power domain drivers
> > to request the reset control in the "released/don't care" state
> > initially.

This is a consequence of the above. I thought that if
reset_control_get_exclusive implicitly acquires the reset, there can't
be two controls requested for the same reset line without another
request method that returns its reset control in a 'released' state.
For the power domain use case this does not seem to be necessary.

> I don't think we actually need that for power domains, because they will
> typically be enabled over the duration of a device's driver's probe
> anyway. So I think this would work:

Yes, since the driver that yields its reset line to the power domain
driver dependsa on the power domain, by definition the power domain
probes first and thus has the opportunity to request the reset control
first and then immediately release it so that the other driver can be
probed.

> 	power domains:
> 
> 		power_off()
> 		{
> 			reset_control_acquire();
> 			reset_control_assert();
> 		}
> 
> 		power_on()
> 		{
> 			reset_control_deassert();
> 			reset_control_release();
> 		}
> 
> 	SOR:
> 
> 		runtime_suspend()
> 		{
> 			reset_control_assert();
> 			reset_control_release();
> 		}
> 
> 		runtime_resume()
> 		{
> 			reset_control_acquire();
> 			reset_control_deassert();
> 		}

If the reset line is kept asserted while the power domain is turned off,
it could indeed stay acquired by the power domain.

> Hm... actually this means that power domains would have to request the
> reset controls and call reset_control_acquire() during probe. That way
> when the domain is powered on it will release the reset and free it up
> for the SOR driver to use.

If you can guarantee that the power domain is powered up and releases
the reset control before the SOR driver tries to request the reset line,
that would work.

> This seems right because it also happens to work from a runtime PM
> sequencing point of view.
> 
> I think the problem for single-user exclusive reset controls could be
> solved by making use of the reference counting that's already used by
> shared resets. We should be able to go ahead and use the reference
> counting in general, and the acquire()/release() dance would only have
> to be enforced when the reference count is > 1.

I'm not sure I understand what you mean by making use of the shared
resets' refcounting. I suppose you could check the reset_control's
refcnt to determine whether there are other users. Or did you want to
repurpose deassert_count?

> I'd probably have to prototype this to get a clearer picture of this,
> but I think this is very promising.
> 
> Does the above sound about right?

Apart from the last part, yes.

regards
Philipp
