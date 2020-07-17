From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v10 0/5] NVIDIA ARM SMMU Implementation
Date: Fri, 17 Jul 2020 22:36:26 +0000
Message-ID: <BYAPR12MB282220FED958EED2AA6AA860B37C0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
 <20200713135020.GD2739@willie-the-truck>
 <20200717100337.GA8673@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200717100337.GA8673@willie-the-truck>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org" <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, "robin.murphy-5wv7dgnIgG8@public.gmane.org" <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicoli
List-Id: linux-tegra@vger.kernel.org

>On Mon, Jul 13, 2020 at 02:50:20PM +0100, Will Deacon wrote:
>> On Tue, Jul 07, 2020 at 10:00:12PM -0700, Krishna Reddy wrote:
> >> Changes in v10:
>> > Perform SMMU base ioremap before calling implementation init.
>> > Check for Global faults across both ARM MMU-500s during global interru=
pt.
>> > Check for context faults across all contexts of both ARM MMU-500s duri=
ng context fault interrupt.
> >> Add new DT binding nvidia,smmu-500 for NVIDIA implementation.
>>
>> Please repost based on my SMMU queue, as this doesn't currently apply.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=3D
>> for-joerg/arm-smmu/updates

>Any update on this, please? It would be a shame to miss 5.9 now that the p=
atches look alright.

Thanks for pinging.
I have been out of the office this week. Just started working on reposting =
patches.

Will
