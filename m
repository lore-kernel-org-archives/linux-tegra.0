From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [REGRESSION] brcmfmac: NULL pointer deference starting
 next-20181107
Date: Tue, 13 Nov 2018 13:32:17 +0000
Message-ID: <82736fa6-f3cc-f45f-a4b0-dba485531f7d@nvidia.com>
References: <dbc5e8f9-6f14-77d2-be2a-f0738e13b773@nvidia.com>
 <9f72ac4f-a83a-7af7-3c26-b1ced6d98653@broadcom.com>
 <9e0a7997-4c14-a3a1-c935-d674270533aa@redhat.com>
 <000bfd39-10cf-661c-9512-0410782168dc@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000bfd39-10cf-661c-9512-0410782168dc@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@codeaurora.org>, linux-tegra <linux-tegra@vger.kernel.org>, linux-wireless@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-tegra@vger.kernel.org


On 13/11/2018 13:21, Jon Hunter wrote:

...

>> IMHO the best fix here would be to modify efivar_entry_size(),
>> adding:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0if (!ops)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOENT;
>>
>> Which makes it return the same error as when we do have efivar
>> support but the requested variable is not found.
>=20
> So the above did not work. I see a patch from Arend and I will give this
> a try.

FWIW, this did work ...

diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
index 9336ffdf6e2c..8181e548f32b 100644
--- a/drivers/firmware/efi/vars.c
+++ b/drivers/firmware/efi/vars.c
@@ -829,9 +829,14 @@ struct efivar_entry *efivar_entry_find(efi_char16_t
*name, efi_guid_t guid,
  */
 int efivar_entry_size(struct efivar_entry *entry, unsigned long *size)
 {
-       const struct efivar_operations *ops =3D __efivars->ops;
+       const struct efivar_operations *ops;
        efi_status_t status;

+       if (!__efivars || !__efivars->ops)
+               return -ENOENT;
+
+       ops =3D __efivars->ops;
+
        *size =3D 0;

        if (down_interruptible(&efivars_lock))

I will let you know about Arend's patch as well.

Jon

--=20
nvpublic
