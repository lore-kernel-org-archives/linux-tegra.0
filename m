From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] reset: Don't WARN if trying to get a used reset control
Date: Wed, 06 Feb 2019 11:28:05 +0100
Message-ID: <1549448885.3338.4.camel@pengutronix.de>
References: <20190125101554.5947-1-thierry.reding@gmail.com>
         <1548674808.6421.3.camel@pengutronix.de> <20190128145836.GA31317@ulmo>
         <1548849808.3939.7.camel@pengutronix.de> <20190201140025.GB12829@ulmo>
         <1549389941.3929.14.camel@pengutronix.de>
         <20190205221300.GA1372@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190205221300.GA1372@mithrandir>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 2019-02-05 at 23:13 +0100, Thierry Reding wrote:
[...]
> > Drivers that never call _acquire()/_release() must continue to work as
> > they are, so exclusive reset controls have to be acquired by default.
> 
> I don't think they have to. See below.

Currently the API makes guarantees about the state a reset line is in
after an assert() or deassert() call. I'm thinking of the following
scenario:

driver A                     driver B

request_exclusive()
deassert()
 |                           request_exclusive()
 |                           acquire()
 |                           assert()
 | driver A expects reset     | driver B expects reset line
 | line to stay deasserted    | to stay asserted during this
 | during this time           | this time
 |                           release()
assert()

If driver A deassert() succeeds because the control refcnt is still 1,
and driver B acquire() succeeds because driver A didn't explicitly
acquire the control, driver B assert() should succeed as well
and that would cause a conflict without either driver getting an error.

Also, how to decide at driver B request_exclusive() time whether or not
to throw a warning? We the core doesn't know at this point whether
driver B will use acquire()/release().

[...]
> > If the reset line is kept asserted while the power domain is turned off,
> > it could indeed stay acquired by the power domain.
> 
> That's at least the way that it works on Tegra. Not sure if that is
> universally applicable, though it seems logical to me from a hardware
> point of view. It may not be required to keep the reset asserted while
> the power domain is turned off, but I'd be surprised if there was a
> requirement that it be deasserted while the power domain is off.

There is hardware that doesn't allow to control the level of the reset
line, providing only a self clearing bit that can be used to trigger a
reset pulse (via reset_control_reset()).

> > > Hm... actually this means that power domains would have to request the
> > > reset controls and call reset_control_acquire() during probe. That way
> > > when the domain is powered on it will release the reset and free it up
> > > for the SOR driver to use.
> > 
> > If you can guarantee that the power domain is powered up and releases
> > the reset control before the SOR driver tries to request the reset line,
> > that would work.
> 
> Well, that's the part that the acquire/release protocol would enforce.

Only if both drivers use it. I'd prefer the API to provide consistent
behaviour even if one of the drivers doesn't use acquire/release.

> If your device shares a reset control with a power domain, this should
> work fine, provided that the device driver uses the reset only between
> (or during) ->runtime_resume() and ->runtime_suspend().

There should be a clear error path in case drivers don't use the reset
control only during suspend/resume as expected.

> > > This seems right because it also happens to work from a runtime PM
> > > sequencing point of view.
> > > 
> > > I think the problem for single-user exclusive reset controls could be
> > > solved by making use of the reference counting that's already used by
> > > shared resets. We should be able to go ahead and use the reference
> > > counting in general, and the acquire()/release() dance would only have
> > > to be enforced when the reference count is > 1.
> > 
> > I'm not sure I understand what you mean by making use of the shared
> > resets' refcounting. I suppose you could check the reset_control's
> > refcnt to determine whether there are other users. Or did you want to
> > repurpose deassert_count?
> 
> Yes, if we make the new acquire/release protocol only apply if the
> reset control's refcnt is > 1, then I think we should be able to keep
> exclusive resets working exactly the same way they are now. Since the
> exclusive resets are guaranteed to have refcnt == 1 right now, there
> should be no need for them to be implicitly acquired at request time.

Ok, thanks for the explanation. That is correct, but it would break the
guarantee we give for exclusive reset controls, that the state of the
reset line stays exactly as requested. refcnt could change at any time
due to a second driver being probed, that could acquire and (de)assert
the reset line.

> However, when you start using them from multiple users, the acquire/
> release protocol would kick in and refuse to assert/deassert before
> you've acquired them.
>
> I think we should also be able to keep the WARN_ON(), albeit maybe in
> different form. We could have one if the user tries to acquire a reset
> control that's already acquired. And we could also have a warning if we
> assert or deassert a reset control that hasn't been acquired *and* that
> has refcnt > 1. With the above I think "acquired" really needs to mean
> acquired && refcnt > 1, and then the current exclusive resets should
> work out of the box.

How would you resolve the above scenario? Implicitly acquiring exclusive
resets during request by default would be one method, but maybe there is
a better one?

> I was wondering whether maybe we needed a way to track the current owner
> of a reset control, so that we could be clever about when acquire needs
> to fail or succeed (e.g. acquiring twice by the same owner would be
> okay), but I think that's overkill. I think this should just be treated
> like a lock and drivers need to make sure they properly balance acquire
> and release calls.

I agree.

regards
Philipp
