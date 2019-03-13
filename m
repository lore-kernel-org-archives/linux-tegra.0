From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 2/2] dmaengine: tegra210-adma: update system sleep
 callbacks
Date: Wed, 13 Mar 2019 16:26:01 +0530
Message-ID: <2d0a98d0-015a-15a0-7c40-5d1489d228cd@nvidia.com>
References: <1552455794-24946-1-git-send-email-spujar@nvidia.com>
 <1552455794-24946-2-git-send-email-spujar@nvidia.com>
 <c4d0a061-e435-8a60-0dfc-f8e66c0a9f0b@nvidia.com>
 <51f5a49e-f105-604c-130c-fd3d0a07bbc5@nvidia.com>
 <1466b97e-2cbd-9469-6646-fee85a7efa58@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466b97e-2cbd-9469-6646-fee85a7efa58@nvidia.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, dan.j.williams@intel.com, vkoul@kernel.org
Cc: treding@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 3/13/2019 4:19 PM, Jon Hunter wrote:
> On 13/03/2019 10:40, Sameer Pujar wrote:
>> On 3/13/2019 3:58 PM, Jon Hunter wrote:
>>> On 13/03/2019 05:43, Sameer Pujar wrote:
>>>> If the driver is active till late suspend, where runtime PM cannot run=
,
>>>> force suspend is essential in such case to put the device in low power
>>>> state. Thus pm_runtime_force_suspend and pm_runtime_force_resume are
>>>> used as system sleep callbacks during system wide PM transitions.
>>>>
>>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>>> ---
>>>>  =C2=A0 drivers/dma/tegra210-adma.c | 10 ++--------
>>>>  =C2=A0 1 file changed, 2 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
>>>> index 650cd9c..be29171 100644
>>>> --- a/drivers/dma/tegra210-adma.c
>>>> +++ b/drivers/dma/tegra210-adma.c
>>>> @@ -796,17 +796,11 @@ static int tegra_adma_remove(struct
>>>> platform_device *pdev)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>  =C2=A0 }
>>>>  =C2=A0 -#ifdef CONFIG_PM_SLEEP
>>>> -static int tegra_adma_pm_suspend(struct device *dev)
>>>> -{
>>>> -=C2=A0=C2=A0=C2=A0 return pm_runtime_suspended(dev) =3D=3D false;
>>>> -}
>>>> -#endif
>>>> -
>>>>  =C2=A0 static const struct dev_pm_ops tegra_adma_dev_pm_ops =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET_RUNTIME_PM_OPS(tegra_adma_runtime_=
suspend,
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_adma_runtime_resume, NULL)
>>>> -=C2=A0=C2=A0=C2=A0 SET_SYSTEM_SLEEP_PM_OPS(tegra_adma_pm_suspend, NUL=
L)
>>>> +=C2=A0=C2=A0=C2=A0 SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pm_runtime_force_resume)
>>>>  =C2=A0 };
>>> Looking at our downstream kernel we use LATE_SYSTEM_SLEEP for these. An=
y
>>> reason why you changed this?
>> I think, I just wanted to replace function calls for system sleep here
>> and probably did
>> not see exactly what we have in downstream kernel at that point. Looking
>> at the commit
>> log in downstream, it might qualify for separate patch.
>> Let me know if you think, its better to add here.
> I see no reason to change this from what we have been using and testing
> downstream. I don't think that this warrants yet another patch for this.
> Furthermore, the changelog references 'late' so it does not seem to
> align with the change itself.
Agree, will update. Thanks.
>
> Cheers
> Jon
>
