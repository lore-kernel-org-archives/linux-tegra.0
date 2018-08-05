From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [RFC PATCH v1] memory: tegra: Block DMA for clients HW on a
 faulty memory access
Date: Sun, 5 Aug 2018 03:11:57 +0300
Message-ID: <89f0794e-affa-dba0-9684-582ce5570cad@kapsi.fi>
References: <20180508165841.13758-1-digetx@gmail.com>
 <2607799.I2xByD6lqT@dimapc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2607799.I2xByD6lqT@dimapc>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

One potential issue is with host1x clients where userspace processes can 
submit jobs with invalid memory accesses (addresses not mapped to 
IOMMU). If when such a failure happens, we disable the DMA for the whole 
host1x client, unrelated userspace processes may see failures even 
though there is no problem with their jobs.

Mikko

On 08/04/2018 02:53 PM, Dmitry Osipenko wrote:
> On Tuesday, 8 May 2018 19:58:41 MSK Dmitry Osipenko wrote:
>> Currently Memory Controller informs about erroneous memory accesses done
>> by memory clients and that's it. Let's make it to block whole HW unit
>> that corresponds to the misbehaving memory client in order to try to avoid
>> memory corruptions and to stop deliberate attempts of manipulation by a
>> misbehaving client.
> 
> Guys, any comments? That is a kinda useful feature, in worst case only some of
> memory could get corrupted instead of trashing the whole memory. In my
> experience with T20/30, the interrupt handling latency is low and blocking
> happens immediately after the first page fault.
> 
> 
> 
