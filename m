From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] of: Add NVIDIA Tegra Legacy Interrupt Controller
 binding
Date: Tue, 26 Aug 2014 08:17:40 +0200
Message-ID: <20140826061739.GB15573@ulmo>
References: <1403917351-13215-1-git-send-email-thierry.reding@gmail.com>
 <53B1C948.6050603@wwwdotorg.org>
 <53FB73EE.7000508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53FB73EE.7000508-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2014 at 11:35:42AM -0600, Stephen Warren wrote:
> On 06/30/2014 02:32 PM, Stephen Warren wrote:
> >On 06/27/2014 07:02 PM, Thierry Reding wrote:
> >>From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >>The Legacy Interrupt Controller found on NVIDIA Tegra SoCs is used by
> >>the AVP coprocessor and can also serve as a backup for the ARM Cortex
> >>CPU's local interrupt controller (GIC).
> >>
> >>The LIC is subdivided into multiple identical units, each handling 32
> >>possible interrupt sources.
> >
> >The series looks OK to me, although I guess there will be a V3 to
> >address Mark's comments?
>=20
> Thierry, do you still want this series applied? I'm not sure if it's
> required by or conflicts with any of your later patches to move code out =
of
> arch/arm/mach-tegra/?
>=20
> If this series should still be applied, I guess I can fix up Mark's
> remaining comment (the bracketing of the multiple reg entries in the DT)
> when applying it, at least if you don't want to repost it yourself.

This was originally meant to be moved out of arch/arm/mach-tegra and
shared for upcoming 64-bit SoCs, but it seems like we may not need this
code for 64-bit at all.

On the other hand the series is an improvement over what we've had
before, so there may still be some value in merging it. I'll respin v3.

Thierry

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/CaDAAoJEN0jrNd/PrOhxeMQAMCeaUmsnWiLaRD74omgCuvU
Y1sO1RsNkUEMGhfylPDIIuW3NaHcpteandz1bUgz4wXlK0F1an0mqjG6oipRLGMR
KJ0LsK7E8nOSs+NSTmSiULfJF71Wd0gmv+EvBXG/4LfVjIWOT3vu/cY+hy+yvyav
CBVqTV2uFa22ucNe/txeIdVbqU8f1t/a8MXpqYRosZwhrXqhS64FaKifIIz5iWi8
4oyv4lW29lBPpstv81q3luDuxG7jht+06ycyDZ2j2PGrRLRdxntj2uvTuJhcG3eR
75cOJQ6yjTJFuQLe7jq86PV4+oq9xYIvDOM01gNocUq8/hVmOkhYo/qk8CbE4Hny
3Qyz4kX2mnk+lPR/ywCcBjuCZaNy5CIMl/o3J11opiCJ8j2dWHep4OykNwBODQg5
V/kbhqDckp73kKDzxKqGgBjWWbMiNXdw5kVm4sztrL/q1Qo6ZPzctoSxEhnphCHg
Lrxb0SsYrlp5KWfvpCIf+2eqcPA1jAvlZLo+8WKuqSBTGdT9/tm2utcAM7aIQQzY
DqA2KAsRrsgWMEGF7vsiG2bz99WZW3NSnuko0IsjJx7G0R5mXz/y3UkG4xF1xJl6
a00runHBZk9H/OxvGK+XhEl9y7ZR2ZIpF9Z6eQB+Xyx9SMENMRg8Be/ybZutcDT4
I0RI42PuJKu8sDK2i8l6
=loAi
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
