From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [REGRESSION] brcmfmac: NULL pointer deference starting
 next-20181107
Date: Tue, 13 Nov 2018 11:29:19 +0000
Message-ID: <d3783759-9030-76bc-d218-6f92b462de7f@nvidia.com>
References: <dbc5e8f9-6f14-77d2-be2a-f0738e13b773@nvidia.com>
 <9f72ac4f-a83a-7af7-3c26-b1ced6d98653@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f72ac4f-a83a-7af7-3c26-b1ced6d98653@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Hans de Goede <hdegoede@redhat.com>, Kalle Valo <kvalo@codeaurora.org>, linux-tegra <linux-tegra@vger.kernel.org>, linux-wireless@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-tegra@vger.kernel.org

Hi Arend,

On 13/11/2018 10:24, Arend van Spriel wrote:

...

> I tried building drivers/firmware/efi/vars.c using tegra_defconfig. Had
> to enable CONFIG_EFI. So the null pointer access is a 0x00000008 so I
> looked at the disassembly below:
>=20
> int efivar_entry_size(struct efivar_entry *entry, unsigned long *size)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0 310:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e1a0500=
1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0=C2=A0 r5,=
 r1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct efivar_operations=
 *ops =3D __efivars->ops;
> =3D=3D>=C2=A0 314:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e5936008=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldr=C2=A0=C2=A0=C2=A0=C2=A0 r6, [r3, #8]
>=20
> So I think __efivars is NULL on your platform. It is private to the
> source file. Not sure how the driver should deal with this. Maybe use
> efi_enabled() but not sure what feature to use. My best bet would be
> EFI_RUNTIME_SERVICES.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 efi_status_t status;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *size =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0 318:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e3a0300=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0=C2=A0 r3,=
 #0
> =C2=A0=C2=A0=C2=A0=C2=A0 31c:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e581300=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str=C2=A0=C2=A0=C2=A0=C2=A0 r3,=
 [r1]
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (down_interruptible(&efivar=
s_lock))
> =C2=A0=C2=A0=C2=A0=C2=A0 320:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ebfffff=
e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bl=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0 <down_interruptible>
> =C2=A0=C2=A0=C2=A0=C2=A0 324:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e250400=
0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subs=C2=A0=C2=A0=C2=A0 r4, r0, =
#0
> =C2=A0=C2=A0=C2=A0=C2=A0 328:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1a00001=
2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bne=C2=A0=C2=A0=C2=A0=C2=A0 378=
 <efivar_entry_size+0x80>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return -EINTR;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D ops->get_variable(e=
ntry->var.VariableName,

So actually, I am seeing the crash with the 'multi_v7_defconfig' and I
don't see it with the 'tegra_defconfig' (probably because CONFIG_EFI is
not enabled).

Cheers
Jon

--=20
nvpublic
