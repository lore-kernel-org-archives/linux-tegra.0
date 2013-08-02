From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: Re: [PATCH 1/6] usb: host: add has_tdi_phy_lpm capability bit
Date: Fri, 2 Aug 2013 18:42:47 +0300
Message-ID: <51FBD377.8060705@nvidia.com>
References: <1375292522-7855-1-git-send-email-ttynkkynen@nvidia.com> <1375292522-7855-2-git-send-email-ttynkkynen@nvidia.com> <20130801100544.76233b42@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130801100544.76233b42@parrot.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthieu CASTET <matthieu.castet@parrot.com>
Cc: "balbi@ti.com" <balbi@ti.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, Alexander Shishkin <alexander.shishkin@linux.intel.com>
List-Id: linux-tegra@vger.kernel.org

On 08/01/2013 11:05 AM, Matthieu CASTET wrote:
> Hi,
>=20
> Le Wed, 31 Jul 2013 18:41:57 +0100,
> Tuomas Tynkkynen <ttynkkynen@nvidia.com> a =E9crit :
>=20
>> The has_hostpc capability bit indicates that the host controller has
>> the HOSTPC register extensions, but at the same time enables clock
>> disabling power saving features with the PHY Low Power Clock Disable
>> (PHCD) bit.
>>
>> However, some host controllers have the HOSTPC extensions but don't
>> support the low-power feature, so the PHCD bit must not be set on
>> those controllers. Add a separate capability bit for the low-power
>> feature instead, and change all existing users of has_hostpc to use
>> this new capability bit.
>>
>> The idea for this commit is taken from an old 2012 commit that never
>> got merged ("disociate chipidea PHY low power suspend control from
>> hostpc")
> Note that because of the different register layout (see "add phy low
> power suspend for older chipidea core" commit in the same series), we
> should not set has_tdi_phy_lpm if has_hostpc =3D=3D 0 with the curren=
t code.
>=20
> May be you should have change the ehci->has_hostpc to (ehci->has_host=
pc
> && ehci->has_tdi_phy_lpm).

Hmm, I see. Do you think there could be a case where that could get acc=
identally
get triggered via autodetection? That patch series seems to set either =
both or neither.
And I figure no one will be explicitly setting that flag (if has_hostpc=
 =3D=3D 0) without
implementing the non-has_hostpc case first.

>=20
> BTW Alan make some comment on the commit :
> http://marc.info/?l=3Dlinux-usb&m=3D133701342028213&w=3D2
>=20
> They may apply to your commit.
>=20
>>
>> Inspired-by: Matthieu CASTET <matthieu.castet@parrot.com>
>> Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
>> ---
>>  drivers/usb/chipidea/host.c |  1 +
>>  drivers/usb/host/ehci-hub.c | 14 +++++++-------
>>  drivers/usb/host/ehci.h     |  1 +
>>  3 files changed, 9 insertions(+), 7 deletions(-)
>>
