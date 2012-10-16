From: Inki Dae <daeinki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Linaro-mm-sig] [RFC 0/2] DMA-mapping & IOMMU - physically contiguous allocations
Date: Wed, 17 Oct 2012 07:54:17 +0900
Message-ID: <A52B7C89-16F2-44A0-A9FF-2EB599F4F074@gmail.com>
References: <CAAQKjZMYFNMEnb2ue2aR+6AEbOixnQFyggbXrThBCW5VOznePg@mail.gmail.com> <20121016090434.7d5e088152a3e0b0606903c8@nvidia.com> <CAAQKjZNQFfxpr-7dFb4cgNB2Gkrxxrswds_fSrYgssxXaqRF7g@mail.gmail.com> <20121016.171338.1300372057637804407.hdoyu@nvidia.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121016.171338.1300372057637804407.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, "kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Hiroshi,



2012. 10. 16. =BF=C0=C8=C4 11:13 Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =C0=DB=
=BC=BA:

> Hi Inki,
>=20
> Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote @ Tue, 16 Oct 2012 12:12:49 +02=
00:
>=20
>> Hi Hiroshi,
>>=20
>> 2012/10/16 Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
>>> Hi Inki/Marek,
>>>=20
>>> On Tue, 16 Oct 2012 02:50:16 +0200
>>> Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>=20
>>>> 2012/10/15 Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
>>>>> Hello,
>>>>>=20
>>>>> Some devices, which have IOMMU, for some use cases might require =
to
>>>>> allocate a buffers for DMA which is contiguous in physical memory=
=2E Such
>>>>> use cases appears for example in DRM subsystem when one wants to =
improve
>>>>> performance or use secure buffer protection.
>>>>>=20
>>>>> I would like to ask if adding a new attribute, as proposed in thi=
s RFC
>>>>> is a good idea? I feel that it might be an attribute just for a s=
ingle
>>>>> driver, but I would like to know your opinion. Should we look for=
 other
>>>>> solution?
>>>>>=20
>>>>=20
>>>> In addition, currently we have worked dma-mapping-based iommu supp=
ort
>>>> for exynos drm driver with this patch set so this patch set has be=
en
>>>> tested with iommu enabled exynos drm driver and worked fine. actua=
lly,
>>>> this feature is needed for secure mode such as TrustZone. in case =
of
>>>> Exynos SoC, memory region for secure mode should be physically
>>>> contiguous and also maybe OMAP but now dma-mapping framework doesn=
't
>>>> guarantee physically continuous memory allocation so this patch se=
t
>>>> would make it possible.
>>>=20
>>> Agree that the contigous memory allocation is necessary for us too.
>>>=20
>>> In addition to those contiguous/discontiguous page allocation, is
>>> there any way to _import_ anonymous pages allocated by a process to=
 be
>>> used in dma-mapping API later?
>>>=20
>>> I'm considering the following scenario, an user process allocates a
>>> buffer by malloc() in advance, and then it asks some driver to conv=
ert
>>> that buffer into IOMMU'able/DMA'able ones later. In this case, page=
s
>>> are discouguous and even they may not be yet allocated at
>>> malloc()/mmap().
>>>=20
>>=20
>> I'm not sure I understand what you mean but we had already tried thi=
s
>> way and for this, you can refer to below link,
>>               http://www.mail-archive.com/dri-devel-PD4FTy7X32lNgt0PjOBp9w@public.gmane.org=
p.org/msg22555.html
>=20
> The above patch doesn't seem to have so much platform/SoC specific
> code but rather it could common over other SoC as well. Is there any
> plan to make it more generic, which can be used by other DRM drivers?
>=20

Right, the above patch has no any platform/SoC specific code but doesn'=
t use dma-mapping API . Anyway we should refrain from using such thing =
because gem object could still be used and shared with other processes =
even if user process freed user region allocated by malloc()

And our new patch in progress would resolve this issue and this way is =
similar to drm-based via driver of mainline kernel. And this patch isn'=
t considered for common use and is specific to platform/SoC so much. Th=
e pages backed can be used only by 2d gpu's dma.

Thanks,
Inki Dae

> --
> To unsubscribe, send a message with 'unsubscribe linux-mm' in
> the body to majordomo-Bw31MaZKKs0EbZ0PF+XxCw@public.gmane.org  For more info on Linux MM,
> see: http://www.linux-mm.org/ .
> Don't email: <a href=3Dmailto:"dont-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org"> email-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org </a>
