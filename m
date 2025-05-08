Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDBE22068E;
	Thu,  8 May 2025 21:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746739647; cv=none; b=LTz0bZGNXbKI1XO3weWTZWfqlnHOme6HILDEddsJAYq4W3BbQgoDLBx/6CaU9DtCL0XfHR9aosIW1YW9ohhKbFWn1mGyfg6J+cGIuwYvws4XzfZ6jS8H2CSa5HXqYivpm1sTBEF53kuLIkDT707mFdRUg7Ld2KSZ2DozP53OXuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746739647; c=relaxed/simple;
	bh=l94ZU3KCPicExHOtSiAVCgSoXi/vYbcj9dNKqJ9c69k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pw5VnU34feaJE0TBNHhGVwVf4UxjfaRrLUALMq9WeOujpi+cz+p+sU0XdCogPgVqtNVHyFcxvKZzGAM+VoPvmFH7RpYCnJRZsaaYRyaDD+IH0+3yU+WzYH9RyVJ4vOPHcOKbuVhZFItdu2DeCYY2z6GyKTUsfCWwBFvegVhpSGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjZneIB0; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjZneIB0"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0b308856fso956575f8f.2;
        Thu, 08 May 2025 14:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746739643; x=1747344443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J4eszvO5oARzZZ5it48CSfvqjiopwIx5Q1lcjvjROLo=;
        b=EjZneIB0RteczBIo138+HPgsLaf4hP8hmAFYqS9paHYiplyIH2nInjmYWVvOT2r4o7
         RCQ/1894mj87RtMKKhiE2rfkkkvRBuF9qJCu/68y9zeWZ/4VExGmWpXbsh65Savs6hzm
         qdhoaZASvcfmyY9rwSxjZ1QPrRP0xGeFa12JFOHOHhBgxKul9UtNOGiDZE/nVv0P3IUF
         PugHQ9XJFgFMl2X9MnkZHuPguXqwQYQZIXL2QOs6sZN37itk3KZKeWPlKsXmJg1YFk7U
         68SItfHoE4p5diXWUTZbNAsyhcTL0ZEnh0miDw/+htHHKd/AXvWusxMHY2Y3yKP9GOjr
         34ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746739643; x=1747344443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4eszvO5oARzZZ5it48CSfvqjiopwIx5Q1lcjvjROLo=;
        b=HZCZggYxYIqrTU83vZsdIM9RU7j00jdww42lWbF0UmYOPdxi1FVdTtcVtu8rGx9Y8u
         xGT2Ri+bksLN1uiOFGhm40Yg/Y/A3Fw7dQby3OBDJyJS1WbtrkuNr6Gb/hHfonmUYg1q
         rG1z21SSqlflALR8akDDh+3IFjAC/LGxk4lnVwwqiMsMw5czc64l6jyS5KBiJsZFVmXd
         jx5UrQOVVn91BhmWHguaivjESgopZU49fz0538qTjCU2W/UfqVf/XzRLXsGDJABFdKMg
         M3iyFmnhTWpJQgdxAiqqbFCdxyqtQgvtbn4+y2LeAAz6Sv1Ho22TPvQi2oPBlMqQ4IZE
         9YqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1MNjIg0koLltSh3Fz6HWQ6gkeLjRlkICqxWgfOYMtwCEFPEzgUYa12HHQcAVfBTgHd8FnOGZj9FS1@vger.kernel.org, AJvYcCUHd8Hxw9qdLh5gyOyh1/DenXgvt9J8NfJSWyBx3JihpZAI16hJIeD8UnCHjP9njNWrVCLxKuatNNXU4bvq@vger.kernel.org, AJvYcCVQs7AWIAOn72OparaJTKfiUy1AWoKyTJXFy1tFZNTZXb//bBVqfT2BJpZ36zoY0fq9+J4LnnNMdHKTWOxWxuZA@vger.kernel.org, AJvYcCW3zaY6EKFqoAS6jvRp6QbCEWBKQncdwFw8pZuHWQnrmGYjXOHa9b+wSPTqqrHKMh/OxMmrHp4P9xV8Cso=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM2mgMSMeHuDjbEnWXTyZcqcWY41P0nPaHc3OfSpbNtlmdOBut
	BONpw4nUgegg3rgggPe4Jqd637TRNMJVptNp1QfSmv4pGwlRlaPE
X-Gm-Gg: ASbGncuEw90tyFM5g0quuFd16WEZVUcCq3XBZhwj1IPTtxstJ14h244PM3eszJlGKjq
	XYS/JDgujnkF4B9wpGk2g7b42xiARw6KTOR3QRBfVoYHog3tQ+Dyk72skboaRaLC9LP2VXtqRee
	HeFqTb/grbnradkJVGD5C8VD0hX8lm+ta8ILoZvHcEIy75niQhuw9NSqlOPhJKlYFmUkJfHMc1N
	H4bcf+8Ib0mKu5OtC0GduSVSmVxPpzg5zT4LL00Dsk7SfAskcmcMLt1+nbD/Y7vfV+MgsI+H4HR
	Y+l2v74aMFuzLgGNI8GP3OS3ev0v11I6py3iJx9yGn0PORmsaH7ljdCA/EuLtqVz3lELk41qUhd
	cYvkdqr94+A7offjLTXxR/iDE16FHhmWpYDTO9g==
X-Google-Smtp-Source: AGHT+IH74btgcPmUEywWQiW4Gd8j2zqx6NgaQ+ZpRx92ZwJIbHHIZHWdcIkvmigDRMTO3XdwD5nxYg==
X-Received: by 2002:a05:6000:2410:b0:3a0:9de8:88ef with SMTP id ffacd0b85a97d-3a1f64ae398mr825072f8f.49.1746739643177;
        Thu, 08 May 2025 14:27:23 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec912sm1075375f8f.23.2025.05.08.14.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:27:22 -0700 (PDT)
Date: Thu, 8 May 2025 23:27:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
Message-ID: <yczvbwanjadyfife3hnp2khxkgs77pokypqkxotlldjskshskt@xckrkfucg6xx>
References: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>
 <6920a557-9181-4c9c-98f4-a9be4e796a13@kernel.org>
 <CALHNRZ--to8B3zhg6zV90siL0x78BAjhS04DgfLwmnXEiOMe3g@mail.gmail.com>
 <83d17d6e-41c2-4729-94e6-5ccf480c766d@kernel.org>
 <CALHNRZ8+vnXrx7xw=qjpB34MX32hW_m7k+=CdePJpErBPPzv-g@mail.gmail.com>
 <53c943dc-5ea6-456b-a289-08212fc01d5d@kernel.org>
 <CALHNRZ8+X61YzQ_gYRkuAZrz2XFiZK36GDgk=801+384y2KnOQ@mail.gmail.com>
 <CALHNRZ-YZg3cKzRBMGaxRpejFMLSpOOz-FPQEaQVXFpFao40WA@mail.gmail.com>
 <CALHNRZ-jxC5PXqiG4tNShybaU9gZjTz4YT+VXgfQFNQ-Ox7crg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2dq4oemmbh7zaoef"
Content-Disposition: inline
In-Reply-To: <CALHNRZ-jxC5PXqiG4tNShybaU9gZjTz4YT+VXgfQFNQ-Ox7crg@mail.gmail.com>


--2dq4oemmbh7zaoef
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 08:21:55PM -0500, Aaron Kling wrote:
> On Sun, Apr 20, 2025 at 8:45=E2=80=AFPM Aaron Kling <webgeek1234@gmail.co=
m> wrote:
> >
> > On Tue, Apr 8, 2025 at 3:49=E2=80=AFAM Aaron Kling <webgeek1234@gmail.c=
om> wrote:
> > >
> > > On Tue, Apr 8, 2025 at 3:17=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > > >
> > > > On 08/04/2025 09:35, Aaron Kling wrote:
> > > > > On Tue, Apr 8, 2025 at 1:08=E2=80=AFAM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> > > > >>
> > > > >> On 07/04/2025 18:00, Aaron Kling wrote:
> > > > >>> On Mon, Apr 7, 2025 at 7:59=E2=80=AFAM Krzysztof Kozlowski <krz=
k@kernel.org> wrote:
> > > > >>>>
> > > > >>>> On 06/04/2025 23:12, Aaron Kling via B4 Relay wrote:
> > > > >>>>> From: Aaron Kling <webgeek1234@gmail.com>
> > > > >>>>>
> > > > >>>>> This allows using pstore on all such platforms. There are some
> > > > >>>>> differences per arch:
> > > > >>>>>
> > > > >>>>> * Tegra132: Flounder does not appear to enumerate pstore and =
I do not
> > > > >>>>>   have access to norrin, thus Tegra132 is left out of this co=
mmit.
> > > > >>>>> * Tegra210: Does not support ramoops carveouts in the bootloa=
der, instead
> > > > >>>>>   relying on a dowstream driver to allocate the carveout, hen=
ce this
> > > > >>>>>   hardcodes a location matching what the downstream driver pi=
cks.
> > > > >>>>> * Tegra186 and Tegra194 on cboot: Bootloader fills in the add=
ress and
> > > > >>>>>   size in a node specifically named /reserved-memory/ramoops_=
carveout,
> > > > >>>>>   thus these cannot be renamed.
> > > > >>>>> * Tegra194 and Tegra234 on edk2: Bootloader looks up the node=
 based on
> > > > >>>>>   compatible, however the dt still does not know the address,=
 so keeping
> > > > >>>>>   the node name consistent on Tegra186 and newer.
> > > > >>>>>
> > > > >>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > >>>>> ---
> > > > >>>>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++=
++
> > > > >>>>>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++++=
++
> > > > >>>>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 13 +++++++++++++
> > > > >>>>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++=
++
> > > > >>>>>  4 files changed, 61 insertions(+)
> > > > >>>>>
> > > > >>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/=
arm64/boot/dts/nvidia/tegra186.dtsi
> > > > >>>>> index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..2e2b27deb957d=
fd754e42dd03f5a1da5079971dc 100644
> > > > >>>>> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > > > >>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> > > > >>>>> @@ -2051,6 +2051,22 @@ pmu-denver {
> > > > >>>>>               interrupt-affinity =3D <&denver_0 &denver_1>;
> > > > >>>>>       };
> > > > >>>>>
> > > > >>>>> +     reserved-memory {
> > > > >>>>> +             #address-cells =3D <2>;
> > > > >>>>> +             #size-cells =3D <2>;
> > > > >>>>> +             ranges;
> > > > >>>>> +
> > > > >>>>> +             ramoops_carveout {
> > > > >>>>
> > > > >>>> Please follow DTS coding style for name, so this is probably o=
nly ramoops.
> > > > >>>
> > > > >>> As per the commit message regarding tegra186: bootloader fills =
in the
> > > > >>> address and size in a node specifically named
> > > > >>> /reserved-memory/ramoops_carveout, thus these cannot be renamed.
> > > > >>
> > > > >> That's not a reason to introduce issues. Bootloader is supposed =
to
> > > > >> follow same conventions or use aliases or labels (depending on t=
he node).
> > > > >>
> > > > >> If bootloader adds junk, does it mean we have to accept that jun=
k?
> > > > >>
> > > > >>>
> > > > >>>>
> > > > >>>> It does not look like you tested the DTS against bindings. Ple=
ase run
> > > > >>>> `make dtbs_check W=3D1` (see
> > > > >>>> Documentation/devicetree/bindings/writing-schema.rst or
> > > > >>>> https://www.linaro.org/blog/tips-and-tricks-for-validating-dev=
icetree-sources-with-the-devicetree-schema/
> > > > >>>> for instructions).
> > > > >>>> Maybe you need to update your dtschema and yamllint. Don't rel=
y on
> > > > >>>> distro packages for dtschema and be sure you are using the lat=
est
> > > > >>>> released dtschema.
> > > > >>>
> > > > >>> The bot is reporting that the reg field is missing from the add=
ed
> > > > >>> ramoops nodes on t186, t194, and t234. However, as also mention=
ed in
> > > > >>> the commit message, this is intentional because it is expected =
for the
> > > > >>> bootloader to fill that in. It is not known at dt compile time.=
 Is
> > > > >>> there a way to mark this as intentional, so dtschema doesn't fl=
ag it?
> > > > >>
> > > > >> Fix your bootloader or chain load some normal one, like U-Boot.
> > > > > How would chainloading a second bootloader 'fix' previous stage
> > > > > bootloaders trampling on an out-of-sync hardcoded reserved-memory
> > > > > address? It's possible for carveout addresses and sizes to change=
=2E Not
> > > > > from boot to boot on the same version of the Nvidia bootloader, b=
ut
> > > > > potentially from one version to another. Depending on if the
> > > > > bootloader was configured with different carveout sizes.
> > > > >
> > > > > There is precedence for this. When blind cleanup was done on arm
> > > > > device trees, a chromebook broke because the memory node has to be
> > > > > named exactly '/memory' [0]. How is this any different from that =
case?
> > > >
> > > > That was an existing node, so ABI.
> > > >
> > > > > These nodes are an ABI to an existing bootloader. Carveouts on th=
ese
> > > >
> > > > You add new ABI, which I object to.
> > > >
> > > > > archs are set up in bl1 or bl2, which are not source available. I
> > > > > could potentially hardcode things for myself in bl33, which is so=
urce
> > > > > available, but the earlier stages could still overwrite any chosen
> > > > > block depending on how carveouts are configured. But even then, t=
hat
> > > > > will not change the behaviour of the vast majority of units that =
use a
> > > > > fully prebuilt boot stack direct from Nvidia. My intent here is f=
or
> > > > > pstore to work on such units without users needing to use a custom
> > > > > bootloader.
> > > > I understand your goal. What I still do not understand, why bootloa=
der
> > > > even bothers with ramoops carveout. It shouldn't and you should just
> > > > ignore whatever bootloader provides, no?
> > >
> > > Mmm, I actually don't have the answer to this. Ramoops carveout
> > > handling was added to t186 and t194 in cboot for L4T r32.7.3, fairly
> > > late in the life cycle. But it has always been in edk2 for t194 and
> > > t234 afaik. I could hazard some guesses, but don't have any
> > > documentation on why the decision was made. Maybe Thierry or Jonathan
> > > could chime in on why this was done.
> > >
> >
> > Friendly reminder to the Tegra maintainers about this question.
> >
> In lieu of a response from the Tegra subsystem maintainers, I can only
> hazard an assumption, Krzysztof. I presume the pstore carveout is
> bootloader controlled because various stages of the boot stack can
> dynamically allocate memory, and this became bootloader controlled to
> prevent any of those from overwriting pstore. I worry about hardcoding
> an address in the kernel dt, then finding out later that there's an
> in-use configuration that overwrites or corrupts that section of ram
> during boot. What are your thoughts on this? And is there any way for
> this patch to proceed?

I haven't been able to find anything out about this yet. Generally it's
difficult to get the bootloaders updated for these devices. Tegra194 and
Tegra234 may be new enough to make an update eventually go into a
release, but for Tegra186 and older, I honestly wouldn't hold my
breath.

Thierry

--2dq4oemmbh7zaoef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgdIbcACgkQ3SOs138+
s6EPdg/9FJ7BozzVacB7nhPg6uemBRYYOsL1skM6ffIwF4oaA5nciU/RZRgxmxoM
UIdHklJWRmwCsqsVU/MU2kwgJIk7LezvpMq6+3ABsy4N0smAOFIctAt2HQ+IjFPn
qc8GRyI28Y5j87haNS07mN3NhV0xOJ+IYebM8F7ZpLw4uf9C8uimcPi9r7MNl1OV
UzvjYiZpCwSj12emLuDgclTOzGRjdC9+Bvlg6vOpcCU3cTX8VXakmGXAXAXOlJqo
mkGNv0saleR4NVdZX/ZYJRl/e4bcAnanY1DIKk96a2lgBTuMvTfC/4MdylHaQX6R
21NPZ+deuNxgqKIDq8VyTU89pYaRR7ksO0cjEJBsTWzF+27mFtBwfZ0mDzxLJ0z/
R4dhPSKNUkOLHMK/SxvfK4KA7nuI2Pz75PiLWRo4sch/A5HFSZ0AqUcFT5UVEEHd
skLYRvmNS25n2Uoy0LLC+ZTyXiUQUO/kcriAvXlBsxr4cocHD1+iWUDfXksGF0Cy
e3c6+/L7lD7AScITYRpiqUTcBkemg1s4Xgt3MOO9qmjcdotyjfTpnfED5idJdzfH
PSojivUn4l8QeQG+ItAUoX/5+D+E1Eteg/GRVaJJgumXsk8bDRrU81MwsdiqCote
gjak11/KCbdKCSNW39vC7ct9DorHlzIhN2Zv53Ma3hEtaVzx/sc=
=gRlR
-----END PGP SIGNATURE-----

--2dq4oemmbh7zaoef--
