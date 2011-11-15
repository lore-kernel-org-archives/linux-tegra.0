From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] hwspinlock: core: support for TEGRA hardware spinlocks
Date: Tue, 15 Nov 2011 07:51:04 +0100
Message-ID: <20111115065104.GA5705@avionic-0098.mockup.avionic-design.de>
References: <1321334342-3283-1-git-send-email-vwadekar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1321334342-3283-1-git-send-email-vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Varun Wadekar wrote:
> TEGRA has a hardware spinlock block which is used
> to get exclusive access to the hardware blocks either
> from the CPU or the COP. The TEGRA hardware spinlock
> block has the capability to interrupt the requester
> on success. For this the core need not disable
> preemption or interrupts before calling into the
> actual driver. Add lock_timeout to the ops structure
> to facilitate this working and to maintain backward
> compatibility.

You're using "TEGRA" in the patch description, but below it is spelled
"Tegra". Should this be made consistent?

Also, this patch should probably be paired with a patch that actually uses
the new field. That would make it easier to understand the reason for this
change.

> Signed-off-by: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/hwspinlock.txt             |   39 ++++++++++++++++++++++++=
++---
>  drivers/hwspinlock/hwspinlock_core.c     |   16 ++++++++++--
>  drivers/hwspinlock/hwspinlock_internal.h |    3 ++
>  3 files changed, 51 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/hwspinlock.txt b/Documentation/hwspinlock.txt
> index a903ee5..35730b8 100644
> --- a/Documentation/hwspinlock.txt
> +++ b/Documentation/hwspinlock.txt
> @@ -29,6 +29,18 @@ the remote processors, and access to it is synchronize=
d using the hwspinlock
>  module (remote processor directly places new messages in this shared data
>  structure).
> =20
> +The Tegra line of processors has a CPU and a COP similar to the OMAP pro=
cessors.
> +The Tegra SoC has a hardware block which arbitrates access to different =
hardware
> +modules on the SoC between the CPU and the COP. The hardware spinlock bl=
ock
> +also has the capability to interrupt the caller when it has access to the
> +requested hardware module. To facilitate SoCs like Tegra which do a lot =
more
> +than just share data structures between the CPU and the COP, a new callb=
ack,
> +int (*lock_timeout)(struct hwspinlock *lock, unsigned int to), has been =
added
> +to struct hwspinlock_ops. The drivers which support functionality simila=
r to
> +the Tegra SoCs, will use lock_timeout to grant access to the hardware sp=
inlock
> +block on the SoCs. Such SoC drivers will not support all the apis exposed

APIs?

> +by the hwspinlock framework. More information below.
> +
>  A common hwspinlock interface makes it possible to have generic, platfor=
m-
>  independent, drivers.
> =20
> @@ -58,8 +70,11 @@ independent, drivers.
>     - lock a previously-assigned hwspinlock with a timeout limit (specifi=
ed in
>       msecs). If the hwspinlock is already taken, the function will busy =
loop
>       waiting for it to be released, but give up when the timeout elapses.
> -     Upon a successful return from this function, preemption is disabled=
 so
> -     the caller must not sleep, and is advised to release the hwspinlock=
 as
> +     If the underlying hardware driver supports lock_timeout in it's ops=
 structure
> +     then upon a successful return from this function, the caller is all=
owed
> +     to sleep since we do not disable premption or interrupts in this sc=
enario.

preemption?

> +     If not, upon a successful return from this function, preemption is =
disabled
> +     so the caller must not sleep, and is advised to release the hwspinl=
ock as
>       soon as possible, in order to minimize remote cores polling on the
>       hardware interconnect.
>       Returns 0 when successful and an appropriate error code otherwise (=
most
> @@ -68,7 +83,10 @@ independent, drivers.
> =20
>    int hwspin_lock_timeout_irq(struct hwspinlock *hwlock, unsigned int ti=
meout);
>     - lock a previously-assigned hwspinlock with a timeout limit (specifi=
ed in
> -     msecs). If the hwspinlock is already taken, the function will busy =
loop
> +     msecs).
> +     Not supported if lock_timeout is exported from the ops struct by the
> +     underlying driver.
> +     If the hwspinlock is already taken, the function will busy loop
>       waiting for it to be released, but give up when the timeout elapses.
>       Upon a successful return from this function, preemption and the loc=
al
>       interrupts are disabled, so the caller must not sleep, and is advis=
ed to
> @@ -80,7 +98,10 @@ independent, drivers.
>    int hwspin_lock_timeout_irqsave(struct hwspinlock *hwlock, unsigned in=
t to,
>  							unsigned long *flags);
>     - lock a previously-assigned hwspinlock with a timeout limit (specifi=
ed in
> -     msecs). If the hwspinlock is already taken, the function will busy =
loop
> +     msecs).
> +     Not supported if lock_timeout is exported from the ops struct by the
> +     underlying driver.
> +     If the hwspinlock is already taken, the function will busy loop
>       waiting for it to be released, but give up when the timeout elapses.
>       Upon a successful return from this function, preemption is disabled,
>       local interrupts are disabled and their previous state is saved at =
the
> @@ -93,6 +114,8 @@ independent, drivers.
>    int hwspin_trylock(struct hwspinlock *hwlock);
>     - attempt to lock a previously-assigned hwspinlock, but immediately f=
ail if
>       it is already taken.
> +     Not supported if lock_timeout is exported from the ops struct by the
> +     underlying driver.
>       Upon a successful return from this function, preemption is disabled=
 so
>       caller must not sleep, and is advised to release the hwspinlock as =
soon as
>       possible, in order to minimize remote cores polling on the hardware
> @@ -104,6 +127,8 @@ independent, drivers.
>    int hwspin_trylock_irq(struct hwspinlock *hwlock);
>     - attempt to lock a previously-assigned hwspinlock, but immediately f=
ail if
>       it is already taken.
> +     Not supported if lock_timeout is exported from the ops struct by the
> +     underlying driver.
>       Upon a successful return from this function, preemption and the loc=
al
>       interrupts are disabled so caller must not sleep, and is advised to
>       release the hwspinlock as soon as possible.
> @@ -114,6 +139,8 @@ independent, drivers.
>    int hwspin_trylock_irqsave(struct hwspinlock *hwlock, unsigned long *f=
lags);
>     - attempt to lock a previously-assigned hwspinlock, but immediately f=
ail if
>       it is already taken.
> +     Not supported if lock_timeout is exported from the ops struct by the
> +     underlying driver.
>       Upon a successful return from this function, preemption is disabled,
>       the local interrupts are disabled and their previous state is saved
>       at the given flags placeholder. The caller must not sleep, and is a=
dvised
> @@ -130,6 +157,8 @@ independent, drivers.
> =20
>    void hwspin_unlock_irq(struct hwspinlock *hwlock);
>     - unlock a previously-locked hwspinlock and enable local interrupts.
> +     Not supported if lock_timeout is exported from the ops struct by the
> +     underlying driver.
>       The caller should _never_ unlock an hwspinlock which is already unl=
ocked.
>       Doing so is considered a bug (there is no protection against this).
>       Upon a successful return from this function, preemption and local
> @@ -138,6 +167,8 @@ independent, drivers.
>    void
>    hwspin_unlock_irqrestore(struct hwspinlock *hwlock, unsigned long *fla=
gs);
>     - unlock a previously-locked hwspinlock.
> +     Not supported if lock_timeout is exported from the ops struct by the
> +     underlying driver.
>       The caller should _never_ unlock an hwspinlock which is already unl=
ocked.
>       Doing so is considered a bug (there is no protection against this).
>       Upon a successful return from this function, preemption is reenable=
d,
> diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hw=
spinlock_core.c
> index 61c9cf1..520c2c9 100644
> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -91,6 +91,10 @@ int __hwspin_trylock(struct hwspinlock *hwlock, int mo=
de, unsigned long *flags)
> =20
>  	BUG_ON(!hwlock);
>  	BUG_ON(!flags && mode =3D=3D HWLOCK_IRQSTATE);
> +	BUG_ON(hwlock->bank->ops->trylock && hwlock->bank->ops->lock_timeout);
> +
> +	if (!hwlock->bank->ops->trylock)
> +		return -EINVAL;
> =20
>  	/*
>  	 * This spin_lock{_irq, _irqsave} serves three purposes:
> @@ -182,6 +186,9 @@ int __hwspin_lock_timeout(struct hwspinlock *hwlock, =
unsigned int to,
> =20
>  	expire =3D msecs_to_jiffies(to) + jiffies;
> =20
> +	if (hwlock->bank->ops->lock_timeout)
> +		return hwlock->bank->ops->lock_timeout(hwlock, expire);
> +
>  	for (;;) {
>  		/* Try to take the hwspinlock */
>  		ret =3D __hwspin_trylock(hwlock, mode, flags);
> @@ -245,7 +252,10 @@ void __hwspin_unlock(struct hwspinlock *hwlock, int =
mode, unsigned long *flags)
>  	 */
>  	mb();
> =20
> -	hwlock->bank->ops->unlock(hwlock);
> +	if (hwlock->bank->ops->lock_timeout)
> +		return hwlock->bank->ops->unlock(hwlock);
> +	else
> +		hwlock->bank->ops->unlock(hwlock);
> =20
>  	/* Undo the spin_trylock{_irq, _irqsave} called while locking */
>  	if (mode =3D=3D HWLOCK_IRQSTATE)
> @@ -328,8 +338,8 @@ int hwspin_lock_register(struct hwspinlock_device *ba=
nk, struct device *dev,
>  	struct hwspinlock *hwlock;
>  	int ret =3D 0, i;
> =20
> -	if (!bank || !ops || !dev || !num_locks || !ops->trylock ||
> -							!ops->unlock) {
> +	if (!bank || !ops || !dev || !num_locks ||
> +	    (!ops->trylock && !ops->lock_timeout) || !ops->unlock) {
>  		pr_err("invalid parameters\n");
>  		return -EINVAL;
>  	}
> diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinloc=
k/hwspinlock_internal.h
> index d26f78b..b0ba642 100644
> --- a/drivers/hwspinlock/hwspinlock_internal.h
> +++ b/drivers/hwspinlock/hwspinlock_internal.h
> @@ -26,6 +26,8 @@ struct hwspinlock_device;
>  /**
>   * struct hwspinlock_ops - platform-specific hwspinlock handlers
>   *
> + * @lock_timeout: attempt to take the lock and wait with a timeout.
> + * 		  returns 0 on failure and true on success. may_sleep.
>   * @trylock: make a single attempt to take the lock. returns 0 on
>   *	     failure and true on success. may _not_ sleep.
>   * @unlock:  release the lock. always succeed. may _not_ sleep.
> @@ -35,6 +37,7 @@ struct hwspinlock_device;
>   */
>  struct hwspinlock_ops {
>  	int (*trylock)(struct hwspinlock *lock);
> +	int (*lock_timeout)(struct hwspinlock *lock, unsigned int to);
>  	void (*unlock)(struct hwspinlock *lock);
>  	void (*relax)(struct hwspinlock *lock);
>  };
> --=20
> 1.7.1

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7CC9gACgkQZ+BJyKLjJp8ECwCfeSRfJ8OvvPTq4SDXYKcipAdr
6gMAnRwzCTPsZ4yrWGWpUzkCJbf9oxYm
=hM54
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
