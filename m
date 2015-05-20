From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND PATCH 2/2] ARM: dts: tegra: Use labels for overriding
 nodes in Tegra114 boards
Date: Wed, 20 May 2015 14:40:09 +0200
Message-ID: <20150520124008.GB24016@ulmo.nvidia.com>
References: <1432036279-6318-1-git-send-email-k.kozlowski.k@gmail.com>
 <1432036279-6318-2-git-send-email-k.kozlowski.k@gmail.com>
 <CAAVeFu+-EYwZ9veNK8T6ZTc9tV0ZgGGm4M6vsiXe70TGTvfOzA@mail.gmail.com>
 <CAJKOXPeDSOwRU4Btt97Tf6Qd1zj5ctVnL_3-_RWGSy004SAACA@mail.gmail.com>
 <CAAVeFu+2aqCJ-nUomXy+PxKvDEm-yFPd+xq1rvgYiSUp5NohtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFu+2aqCJ-nUomXy+PxKvDEm-yFPd+xq1rvgYiSUp5NohtA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2015 at 02:05:38PM +0900, Alexandre Courbot wrote:
> On Wed, May 20, 2015 at 2:03 PM, Krzysztof Koz=C5=82owski
> <k.kozlowski.k@gmail.com> wrote:
> > 2015-05-20 13:05 GMT+09:00 Alexandre Courbot <gnurou@gmail.com>:
> >> On Tue, May 19, 2015 at 8:51 PM, Krzysztof Kozlowski
> >> <k.kozlowski.k@gmail.com> wrote:
> >>> Usage of labels instead of full paths reduces possible mistakes when
> >>> overriding nodes.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
> >>
> >> Indentation seems to be off by one tab in the added code (hence the
> >> huge size of this patch ; most lines should not change), can you
> >> check?
> >
> > It is correct. This change in indentation is an effect of moving nodes
> > out of first bracket ("\ {"). That is the convention.
> >
> > It us up to you guys if this is worth the effort. For exynos we use
> > label-convention and now I am converting old DTS to it. I think the
> > label-convention is less error-prone when extending or overriding
> > nodes. Also it removes duplicated addresses.
>=20
> I don't really have a strong opinion on this - Stephen and Thierry
> have worked with DT much more, let's see what they think...

I agree with Stephen that this is unnecessary churn. I understand the
reason why people prefer to use labels, but I don't think it's enough of
an issue to warrent rewriting all of the DTS files. I personally don't
like the convention very much because it makes the otherwise very neatly
structured DTS files hard to read.

Thierry

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXICnAAoJEN0jrNd/PrOhIeYP/3UMvKeGd3+ny+UUBW8BpMz+
5Kciba9sb0E+q6f62mbB6h6ITWPFKdrGfvkRqmCFGJy7uMyeluZGET44rLMuNdt5
PSYRlxZq7mLO7/MZ9t1dHI6du8jP5ghGjrxGXqTvQ4l7AwY/4nFZdG95XdZeSSL2
AIoTzwHajsi5i3fFQV3YUfDIIqUvodAUEm6JtW6uHEvmOxY0Ll41DcpAwCi+xho7
2iwGonOwjyJr67s26SIccrOOIBqx1fpZneWa0hx4KVsxbtbc83MYXqXHDvYyFEW8
xEQjy3VDzRAf0Uww9O4iocmUyslDBIVDD18zoFgiUhbcRdwCr90wiGc/DgMyK2gM
MgJWuc34vU1cWb1BNy+ZPwGTexcrP3Ku6EQ0jbNXWo1ZJQQ/urQFO5fIpsyp4GeB
VK3pYM1A8actaZfP9976cdH8PcMYPfVTRLSD76GgmTbdV1kS7QNoTxmr5IbuusJT
4WntVd46619KEaAQm/aM8pQIs1pKw28LPEiqidT2Wa1dQPhSBtOazcJNi9rBaJo3
qNkjbpSvdb85yejXzyBisIxTkOeq3m4zWElY5dFgK0AdOAPpHubBUYfBdG71Y2GF
tNTHg/Nz57y948VBIAS3hpTERBTiQTh0EkwwmWDkFKr6D6zYJCCCgH+XVLXMcXBm
jKmvfobFKq9ibNqD5F+1
=krdU
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
