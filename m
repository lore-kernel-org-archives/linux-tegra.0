From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: mmc: subtract boot sectors from disk size for eMMC 4.3+ devices
Date: Sat, 12 Feb 2011 13:27:17 -0800
Message-ID: <AANLkTimfgcPgVhGXawJtPLeRUKDqUNJab9i=+bOas4YV@mail.gmail.com>
References: <58833f40-65eb-455e-9d51-02d577bef09a@e16g2000pri.googlegroups.com>
	<AANLkTinAY=j2kAvVqUiJQCxGQ84=V98Yo+8PMLK780ro@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinAY=j2kAvVqUiJQCxGQ84=V98Yo+8PMLK780ro-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: drambo <mrdarwinrambo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Android Linux Kernel Development <android-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, sbranden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Linux Tegra Mailing List <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 19, 2011 at 4:06 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> On Wed, Jan 19, 2011 at 2:04 PM, drambo <mrdarwinrambo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
>> Hello,
>>
>> http://android.git.kernel.org/?p=3Dkernel/common.git;a=3Dcommit;h=3D=
f0b0e4bec1e89014f3dcef4da8bcf95428cc771c
>>
>> This patch doesn't appear to apply for our 8 GByte Micron 4.4 device
>> MTFC8GKQDI part and probably other Micron parts as well.
>>
>> I have contacted Micron about the 0xe90000 sector count we read, and
>> they state that:
>>
>> "Actually, the boot partition size is in multiples of 128KB, so each
>> boot partition is 2MB.
>> There are two of them, so the total is 4MB.
>> This is not counted as user area, the 0xe90000 is in addition to the
>> boot and RPMB partitions. =A0The only time the user area would be
>> reduced from the SEC_COUNT value would be if you create general
>> purpose partitions, or enhanced memory areas."
>>
>> Furthermore, when we access the device, the full 0xe90000 sectors ar=
e
>> accessible and valid in our testing, which confirms the Micron
>> statement.
>>
>> This patch is not in the 2.6.36+ kernel.org mmc.c code either, which
>> also make it suspect.
>>
>> Could someone please clarify the reasons for this patch? Thanks.
>>
>> Regards,
>> Darwin
>>
>
> This patch was originally necessary because the kernel could not find
> a gpt partition table located at the end of the eMMC device. =A0Looki=
ng
> at the eMMC spec, I believe you are correct, the sector count read
> from the eMMC ext_csd should not include the boot partition size. =A0=
I
> don't know if the eMMC part we were using incorrectly gave the size,
> or the code in the bootloader that determined where to put the gpt
> incorrectly calculated the end, and the kernel was changed to be
> bug-compatible.
>
> I am hesitant to revert the change, because the Tegra bootloader
> likely does the same calculation, and reverting the patch would break
> any board that expects the old behavior.
>

I reverted this change in the linux-tegra-2.6.36 and android-2.6.36
repositories.  For anyone who has a bug-compatible bootloader, and
relies on the bootloader and kernel agreeing on the size of the eMMC
(for example, to find a GPT at the end of the device), this revert
will break your kernel.  You can either put it back locally in your
tree, or, if you are using GPT, use
https://android.git.kernel.org/?p=3Dkernel/tegra.git;a=3Dcommit;h=3Dfd4=
194e5c3ab51f0eacdc115eeead02dbf8f4d88
to allow the bootloader to pass the actual location of the GPT to the
kernel.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
