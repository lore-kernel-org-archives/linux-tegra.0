From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] regulator: core: Unset supplies when regulators are
 unregistered
Date: Mon, 9 Jan 2017 13:37:18 +0000
Message-ID: <084533f5-d611-59ac-7329-657b0523bdb3@nvidia.com>
References: <1483703678-19575-1-git-send-email-jonathanh@nvidia.com>
 <20170106182953.ayvailx5sxtiyzwe@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170106182953.ayvailx5sxtiyzwe-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 06/01/17 18:29, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Fri, Jan 06, 2017 at 11:54:38AM +0000, Jon Hunter wrote:
> 
>> There is a case where a child regulator is registered before its supply
>> and when the supply is registered successfully, the supply for the child
>> is then set. Although, this in itself is not a problem, a problem arises
>> when the supply is then unregistered again, due to the parent device
>> being probed deferred, after successfully registering the supply. This
>> leaves the regulator with an invalid reference to supply and can
>> eventually result in a kernel panic.
> 
> Why is a parent device doing this?  This doesn't seem like safe or
> helpful behaviour and with probe deferral we'd generally expect the
> device to acquire resources before it starts making use of them.

It is not really the parent that is doing this. The child regulator in
this case is physically a separate regulator from the main PMIC device
that is registering the supply regulators.

The PMIC is registering N regulators and after registering some
successfully one fails because it's supply is not found and the
regulator core returns -EPROBE_DEFER. Normally not finding supply would
not fail but in this case it is necessary because the regulator is in
bypass and the supply is needed to get the voltage.

Actually, this particular regulator was the cause of some other issues
in the past where we needed to fix-up the handling of regulators in
bypass during registration. See commit 45389c47526d ('regulator: core:
Add early supply resolution for regulators').

The real problem is that after one of the PMIC's regulators fails to
register, by then one of the PMIC's other regulators (that has already
been registered) has been added as a supply for another external regulator.

>> Addtionally, even in the normal case when a regulator is unregistered,
>> by unloading a driver, if the regulator happens to be a supply for
>> another regulator it is not removed.
> 
> We can't completely stop people doing this but we do make fairly strong
> efforts to stop people pulling in use devices.

Right, but before removing/unregistering a regulator today, we never
check to see if it is the supply for any other regulator.

>> Fix this by scanning all the registered regulators when a regulator is
>> removed and remove it as a supply to any other regulator. There is a
>> possibility that a child regulator is in use when the supply is removed
>> and so WARN if this happens.
> 
> This seems like storing up trouble for the future, we'll end up with
> live child devices with parents that weren't around or being refcounted
> through some of the lifetime of the device which will doubtless come
> back and bite us later.

Yes I am not completely happy. Maybe we should wait for the parent
device to be bound before allowing any of its's regulators to be added
as supplies for other regulators? I gave the following a quick test and
this seems to work too ...

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 04baac9a165b..e17915861a54 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1553,6 +1553,11 @@ static int regulator_resolve_supply(struct
regulator_dev *rdev)
                }
        }

+       if (!device_is_bound(r->dev.parent)) {
+               put_device(&r->dev);
+               return -EPROBE_DEFER;
+       }
+
        /* Recursively resolve the supply of the supply */
        ret = regulator_resolve_supply(r);
        if (ret < 0) {


The above prevents anyone from using a regulator as a supply if the
parent has not been bound yet. Therefore, if one of the parent's
regulators fails to register, after some have already been successfully
registered, there is no chance any of the successfully added regulators
will have been already added as a supply to some other regulator in the
system. Hope that's clear!

>> Note that the debugfs node for the regulator supply must be freed before
>> the debugfs node for the regulator_dev and so ensure the regulator_dev
>> debugfs node is freed after the any supplies have been removed.
> 
> Please don't mix different changes into one commit, as covered in
> SubmittingPatches please send one patch per change.  This makes things
> easier to 

Sorry, may be I worded this badly, however, it is a consequence of this
particular change and otherwise it would not be needed.

Cheers
Jon

-- 
nvpublic
