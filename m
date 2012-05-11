From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] iommu/tegra: smmu: Add device tree support for SMMU
Date: Fri, 11 May 2012 12:04:57 -0600
Message-ID: <4FAD54C9.6040904@wwwdotorg.org>
References: <1336636221-31575-1-git-send-email-hdoyu@nvidia.com> <1336636221-31575-2-git-send-email-hdoyu@nvidia.com> <4FAC2041.7030405@wwwdotorg.org> <20120511094625.GA11750@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120511094625.GA11750-5C7GfCeVMHo@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joerg Roedel <joerg.roedel-5C7GfCeVMHo@public.gmane.org>
Cc: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/11/2012 03:46 AM, Joerg Roedel wrote:
> On Thu, May 10, 2012 at 02:08:33PM -0600, Stephen Warren wrote:
>> On 05/10/2012 01:50 AM, Hiroshi DOYU wrote:
>>> The necessary info is expected to pass from DT.
>>>
>>> For more precise resource reservation, there shouldn't be any
>>> overlapping of register range between SMMU and MC. SMMU register
>>> offset needs to be calculated correctly, based on its register bank.
>>>
>>> Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>>
>> I expect patch 1 will go through the IOMMU tree, and I'll take patch 2
>> through the Tegra tree.
> 
> Any reason for splitting it up? The patches touch mostly drivers/iommu.
> So to avoid conflicts its probably the best to apply them together.

Patch 1 is the driver that touches drivers/iommu and related
documentation, whereas patch 2 touches the device tree file in
arch/arm/boot/dts. Either of the patches would get conflicts if they
were merged into the "other" tree.
