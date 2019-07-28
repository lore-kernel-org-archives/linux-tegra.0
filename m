From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.14 41/60] PCI: tegra: Enable Relaxed Ordering
 only for Tegra20 & Tegra30
Date: Sun, 28 Jul 2019 11:42:19 -0400
Message-ID: <20190728154219.GI8637@sasha-vm>
References: <20190719041109.18262-1-sashal@kernel.org>
 <20190719041109.18262-41-sashal@kernel.org>
 <20190719135301.GA685@e121166-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190719135301.GA685@e121166-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, Thierry Reding <treding@nvidia.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 19, 2019 at 02:53:09PM +0100, Lorenzo Pieralisi wrote:
>On Fri, Jul 19, 2019 at 12:10:50AM -0400, Sasha Levin wrote:
>> From: Vidya Sagar <vidyas@nvidia.com>
>>
>> [ Upstream commit 7be142caabc4780b13a522c485abc806de5c4114 ]
>>
>> The PCI Tegra controller conversion to a device tree configurable
>> driver in commit d1523b52bff3 ("PCI: tegra: Move PCIe driver
>> to drivers/pci/host") implied that code for the driver can be
>> compiled in for a kernel supporting multiple platforms.
>>
>> Unfortunately, a blind move of the code did not check that some of the
>> quirks that were applied in arch/arm (eg enabling Relaxed Ordering on
>> all PCI devices - since the quirk hook erroneously matches PCI_ANY_ID
>> for both Vendor-ID and Device-ID) are now applied in all kernels that
>> compile the PCI Tegra controlled driver, DT and ACPI alike.
>>
>> This is completely wrong, in that enablement of Relaxed Ordering is only
>> required by default in Tegra20 platforms as described in the Tegra20
>> Technical Reference Manual (available at
>> https://developer.nvidia.com/embedded/downloads#?search=tegra%202 in
>> Section 34.1, where it is mentioned that Relaxed Ordering bit needs to
>> be enabled in its root ports to avoid deadlock in hardware) and in the
>> Tegra30 platforms for the same reasons (unfortunately not documented
>> in the TRM).
>>
>> There is no other strict requirement on PCI devices Relaxed Ordering
>> enablement on any other Tegra platforms or PCI host bridge driver.
>>
>> Fix this quite upsetting situation by limiting the vendor and device IDs
>> to which the Relaxed Ordering quirk applies to the root ports in
>> question, reported above.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> [lorenzo.pieralisi@arm.com: completely rewrote the commit log/fixes tag]
>> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Hi Sasha,
>
>as Jon requested, please drop this patch from the autosel patch
>queue, thank you very much.

Now dropped from the queue, thanks!

--
Thanks,
Sasha
