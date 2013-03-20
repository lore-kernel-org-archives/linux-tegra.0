From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V4 6/9] ARM: mxs: Provide regulator to pwm-backlight
Date: Wed, 20 Mar 2013 09:23:18 +0100
Message-ID: <20130320082318.GA28775@opensource.wolfsonmicro.com>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com>
 <1363719573-20926-7-git-send-email-achew@nvidia.com>
 <201303192227.21717.marex@denx.de> <5148E252.9050900@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6885556834544931844=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5148E252.9050900@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: romain.naour@openwide.fr, thierry.reding@avionic-design.de, philipp.zabel@gmail.com, gxt@mprc.pku.edu.cn, robert.jarzmik@free.fr, laforge@openezx.org, Marek Vasut <marex@denx.de>, kgene.kim@samsung.com, linux@arm.linux.org.uk, linux-samsung-soc@vger.kernel.org, lost.distance@yahoo.com, drwyrm@gmail.com, haojian.zhuang@gmail.com, openezx-devel@lists.openezx.org, acourbot@nvidia.com, linux-tegra@vger.kernel.org, eric.y.miao@gmail.com, linux-arm-kernel@lists.infradead.org, stefan@openezx.org, Andrew Chew <achew@nvidia.com>, kyungmin.park@samsung.com, shawn.guo@linaro.org
List-Id: linux-tegra@vger.kernel.org


--===============6885556834544931844==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 19, 2013 at 04:10:26PM -0600, Stephen Warren wrote:
> On 03/19/2013 03:27 PM, Marek Vasut wrote:

> > Do we really need a mandatory regulator? Why can't it be optional?

> IIRC, the previous advice I've seen is that if a device (driver) uses a
> regulator, it must /require/ a regulator, and if a particular board
> doesn't actually have a SW-controlled regulator, then a fixed- or dummy-
> regulator should be provided to satisfy this requirement.

> CC'ing Mark Brown to make sure I really do Recall Correctly.

Yes, and it should be fixed rather than dummy.  The issue is partly that
it's probably important that the device has power so we don't want to
just ignore errors and partly that this is something which applies to
essentially all devices so whatever we do for this case ought to be done
by the core so all devices can benefit and we don't have to duplicate
lots of code in individual drivers.

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRSXHaAAoJELSic+t+oim95cwP/RmgDDdz+rwCH+YppduQfcvK
d9b9NrEoOhJ+vL2urIpFkc6bESDLc9ObNaisxxFQHS578izScMHSeTvbErEtUAUk
1BejUpKHL5eF8s8vev1+VRGo8uKML5O5PJQ9yrVRif/Xd9jpHmuc64BriwAH7FVO
iDMVQwMzeUmF0eWAmqYecn/kuiAfUJNatrGQvok+8Y81tanD4R1jaVRl0sIOqfpG
QChAtMuiSn9ETY6MCmbGv1SDZCGTHVW3Y438qW7LRu6B5/2nyZYNMW3Iq3KgGm2T
8oMAWnA9AqxFYF1dHwpfuNPwqGRnYqDloXWEgoVFPrEjfo0UpRM0WQ8VSYqlYNw5
euryMoLnOPSjuKFX/CS0OBCojOVilxvWM4FTYbTb5N8ICqnKyYIyWcN4P96thYfp
OereYXdzma5TaoQ3GykvYSIzZnsVItKVqnhd89F3pfzzjsfwdZ9Xt89OdOUEi7+1
z2HvsVPnPaUcybZNlNVotMG9l7SRXhPO64PbAJ8B4ZdL7YHJTJ7GulIEV48uWPV+
ZO4ywW7yZu2ypM1zNWZnz4i9aV4twLk9UfiWo4iEoZvEfZJmBF1Trr3P42DRfeuH
67QmFDQmKCiP08BobQb+FOnZF4UF6GM3319DJRM1VFIMbdlyknxZ3QDQd9A46Ja2
06tmbG6tkTIsb7DXQK42
=Eci5
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--


--===============6885556834544931844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6885556834544931844==--
