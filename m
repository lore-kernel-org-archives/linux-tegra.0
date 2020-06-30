From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Date: Tue, 30 Jun 2020 17:04:14 +0000
Message-ID: <BYAPR12MB2822A100F2BE2D8141F0B585B36F0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
 <53bfa5c8-c32d-6fa3-df60-a18ab33ca1c2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <53bfa5c8-c32d-6fa3-df60-a18ab33ca1c2-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sachin Nikam <Snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Nicolin Chen <nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yu-Huan Hsu <YHsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "robin.murphy-5wv7dgnIgG8@public.gmane.org" <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bitan Biswas <bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

>> NVIDIA's Tegra194 SoC uses two ARM MMU-500s together to interleave 
>> IOVA accesses across them.
>> Add NVIDIA implementation for dual ARM MMU-500s and add new compatible 
>> string for Tegra194 SoC SMMU topology.

>There is no description here of the 3rd SMMU that you mention below.
>I think that we should describe the full picture here.

This driver is primarily for dual SMMU config.  So, It is avoided in the commit message.
However, Implementation supports option to configure 3 instances identically with one SMMU DT node
and is documented in the implementation.

>> +
>> +static inline void __iomem *nvidia_smmu_page(struct arm_smmu_device *smmu,
>> +			       unsigned int inst, int page)

>If you run checkpatch --strict on these you will get a lot of ...

>CHECK: Alignment should match open parenthesis
>#116: FILE: drivers/iommu/arm-smmu-nvidia.c:46:
>+static inline void __iomem *nvidia_smmu_page(struct arm_smmu_device *smmu,
>+			       unsigned int inst, int page)

>We should fix these.

I will fix these if I need to push a new patch set.

>> +static void nvidia_smmu_write_reg(struct arm_smmu_device *smmu,
>> +			    int page, int offset, u32 val) {
>> +	unsigned int i;
>> +	struct nvidia_smmu *nvidia_smmu = to_nvidia_smmu(smmu);
>> +
>> +	for (i = 0; i < nvidia_smmu->num_inst; i++) {
>> +		void __iomem *reg = nvidia_smmu_page(smmu, i, page) + offset;

>Personally, I would declare 'reg' outside of the loop as I feel it will make the code cleaner and easier to read.

It was like that before and is updated to its current form to limit the scope of variables as per Thierry's comments in v6. 
We can just leave it as it is as there is no technical issue here.

-KR

--
nvpublic
