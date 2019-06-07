From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] [RFC] dmaengine: add fifo_size member
Date: Fri, 7 Jun 2019 10:24:00 +0100
Message-ID: <a931c88c-0741-4332-832a-77458b55bfef@nvidia.com>
References: <1556623828-21577-1-git-send-email-spujar@nvidia.com>
 <3368d1e1-0d7f-f602-5b96-a978fcf4d91b@nvidia.com>
 <20190504102304.GZ3845@vkoul-mobl.Dlink>
 <ce0e9c0b-b909-54ae-9086-a1f0f6be903c@nvidia.com>
 <20190506155046.GH3845@vkoul-mobl.Dlink>
 <b7e28e73-7214-f1dc-866f-102410c88323@nvidia.com>
 <ed95f03a-bbe7-ad62-f2e1-9bfe22ec733a@ti.com>
 <4cab47d0-41c3-5a87-48e1-d7f085c2e091@nvidia.com>
 <8a5b84db-c00b-fff4-543f-69d90c245660@nvidia.com>
 <3f836a10-eaf3-f59b-7170-6fe937cf2e43@ti.com>
 <a36302fc-3173-070b-5c97-7d2c55d5e2cc@nvidia.com>
 <a08bec36-b375-6520-eff4-3d847ddfe07d@ti.com>
 <4593f37c-5e89-8559-4e80-99dbfe4235de@nvidia.com>
 <deae510a-f6ae-6a51-2875-a7463cac9169@gmail.com>
 <ac9a965d-0166-3d80-5ac4-ae841d7ae726@nvidia.com>
 <50e1f9ed-1ea0-38f6-1a77-febd6a3a0848@gmail.com>
 <4b098fb6-1a5b-1100-ae16-978a887c9535@nvidia.com>
 <e6741e07-be0c-d16b-36d7-77a3288f0500@gmail.com>
 <a652b103-979d-7910-5e3f-ec4bca3a3a3b@nvidia.com>
 <457eb5e1-40cc-8c0f-e21c-3881c3c04de2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <457eb5e1-40cc-8c0f-e21c-3881c3c04de2@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Sameer Pujar <spujar@nvidia.com>, Vinod Koul <vkoul@kernel.org>
Cc: dan.j.williams@intel.com, tiwai@suse.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, mkumard@nvidia.com, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 06/06/2019 18:25, Dmitry Osipenko wrote:
> 06.06.2019 19:53, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 06/06/2019 17:44, Dmitry Osipenko wrote:
>>> 06.06.2019 19:32, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>
>>>> On 06/06/2019 16:18, Dmitry Osipenko wrote:
>>>>
>>>> ...
>>>>
>>>>>>> If I understood everything correctly, the FIFO buffer is shared amo=
ng
>>>>>>> all of the ADMA clients and hence it should be up to the ADMA drive=
r to
>>>>>>> manage the quotas of the clients. So if there is only one client th=
at
>>>>>>> uses ADMA at a time, then this client will get a whole FIFO buffer,=
 but
>>>>>>> once another client starts to use ADMA, then the ADMA driver will h=
ave
>>>>>>> to reconfigure hardware to split the quotas.
>>>>>>
>>>>>> The FIFO quotas are managed by the ADMAIF driver (does not exist in
>>>>>> mainline currently but we are working to upstream this) because it i=
s
>>>>>> this device that owns and needs to configure the FIFOs. So it is rea=
lly
>>>>>> a means to pass the information from the ADMAIF to the ADMA.
>>>>>
>>>>> So you'd want to reserve a larger FIFO for an audio channel that has =
a
>>>>> higher audio rate since it will perform reads more often. You could a=
lso
>>>>> prioritize one channel over the others, like in a case of audio call =
for
>>>>> example.
>>>>>
>>>>> Is the shared buffer smaller than may be needed by clients in a worst
>>>>> case scenario? If you could split the quotas statically such that eac=
h
>>>>> client won't ever starve, then seems there is no much need in the
>>>>> dynamic configuration.
>>>>
>>>> Actually, this is still very much relevant for the static case. Even i=
f
>>>> we defined a static configuration of the FIFO mapping in the ADMAIF
>>>> driver we still need to pass this information to the ADMA. I don't
>>>> really like the idea of having it statically defined in two different
>>>> drivers.
>>>
>>> Ah, so you need to apply the same configuration in two places. Correct?
>>>
>>> Are ADMAIF and ADMA really two different hardware blocks? Or you
>>> artificially decoupled the ADMA driver?
>>
>> These are two different hardware modules with their own register sets.
>> Yes otherwise, it would be a lot simpler!
>=20
> The register sets are indeed separated, but it looks like that ADMAIF is
> really a part of ADMA that is facing to Audio Crossbar. No? What is the
> purpose of ADMAIF? Maybe you could amend the ADMA hardware description
> with the ADMAIF addition until it's too late.

The ADMA can perform the following transfers (per the CH_CONFIG
register) ...

MEMORY_TO_MEMORY
AHUB_TO_MEMORY
MEMORY_TO_AHUB
AHUB_TO_AHUB

Hence it is possible to use the ADMA to do memory-to-memory transfers
that do not involve the ADMAIF.

So no the ADMAIF is not part of the ADMA. It is purely the interface to
the crossbar (AHUB/APE), but from a hardware standpoint they are
separate. And so no we will not amend the hardware description.

Jon

--=20
nvpublic
