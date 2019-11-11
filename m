From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: stable request: PCI: tegra: Enable Relaxed Ordering only for
 Tegra20 & Tegra30
Date: Mon, 11 Nov 2019 20:52:52 +0530
Message-ID: <9d7871e7-f8aa-1ed5-dc2e-37ba6f218a2f@nvidia.com>
References: <11251eb0-5675-9d3d-d15f-c346781e2bff@nvidia.com>
 <20191111130908.GA448544@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191111130908.GA448544@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, Krishna Thota <kthota@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 11/11/2019 6:39 PM, Greg Kroah-Hartman wrote:
> On Mon, Nov 11, 2019 at 06:24:53PM +0530, Vidya Sagar wrote:
>> Hi Greg,
>> We noticed that the Tegra PCIe host controller driver enabled
>> "Relaxed Ordering" bit in the PCIe configuration space for "all"
>> devices erroneously. We pushed a fix for this through the
>> commit: 7be142caabc4780b13a522c485abc806de5c4114 and it has been
>> soaking in main line for the last four months.
>> Based on the discussion we had @ http://patchwork.ozlabs.org/patch/1127604/
>> we would now like to push it to the following stable kernels
>> 4.19                  : Applies cleanly
>> 3.16, 4.4, 4.9 & 4.14 : Following equivalent patch needs to be used as the
>>                          file was at drivers/pci/host/pci-tegra.c earlier
>>                          (and moved to drivers/pci/controller/pci-tegra.c starting 4.19)
> 
> All now queued up (except for 3.16, that's Ben's tree, he will get to it
> soon.)
> 
> thanks,
> 
> greg k-h
> 

Thanks a lot Greg.

- Vidya Sagar
