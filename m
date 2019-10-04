From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] arm64: tegra: Set dma-ranges for memory subsystem
Date: Fri, 4 Oct 2019 16:06:57 +0300
Message-ID: <3eaff5c9-ee6d-faa2-4771-7eeb9f759c8b@linaro.org>
References: <20191002154654.225690-1-thierry.reding@gmail.com>
 <20191002154946.GA225802@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191002154946.GA225802@ulmo>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 10/2/19 18:49, Thierry Reding wrote:
> On Wed, Oct 02, 2019 at 05:46:54PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> On Tegra194, all clients of the memory subsystem can generally address
>> 40 bits of system memory. However, bit 39 has special meaning and will
>> cause the memory controller to reorder sectors for block-linear buffer
>> formats. This is primarily useful for graphics-related devices.
>>
>> Use of bit 39 must be controlled on a case-by-case basis. Buffers that
>> are used with bit 39 set by one device may be used with bit 39 cleared
>> by other devices.
>>
>> Care must be taken to allocate buffers at addresses that do not require
>> bit 39 to be set. This is normally not an issue for system memory since
>> there are no Tegra-based systems with enough RAM to exhaust the 39-bit
>> physical address space. However, when a device is behind an IOMMU, such
>> as the ARM SMMU on Tegra194, the IOMMUs input address space can cause
>> IOVA allocations to happen in this region. This is for example the case
>> when an operating system implements a top-down allocation policy for IO
>> virtual addresses.
>>
>> To account for this, describe the path that memory accesses take through
>> the system. Memory clients will send requests to the memory controller,
>> which forwards bits [38:0] of the address either to the external memory
>> controller or the SMMU, depending on the stream ID of the access. A good
>> way to describe this is using the interconnects bindings, see:
>>
>> 	Documentation/devicetree/bindings/interconnect/interconnect.txt
>>
>> The standard "dma-mem" path is used to describe the path towards system
>> memory via the memory controller. A dma-ranges property in the memory
>> controller's device tree node limits the range of DMA addresses that the
>> memory clients can use to bits [38:0], ensuring that bit 39 is not used.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>> Arnd, Rob, Robin,
>>
>> This is what I came up with after our discussion on this thread:
>>
>> 	[PATCH 00/11] of: dma-ranges fixes and improvements
>>
>> Please take a look and see if that sounds reasonable. I'm slightly
>> unsure about the interconnects bindings as I used them here. According
>> to the bindings there's always supposed to be a pair of interconnect
>> paths, so this patch is not exactly compliant. It does work fine with
>> the __of_get_dma_parent() code that Maxime introduced a couple of months
>> ago and really very neatly describes the hardware. Interestingly this
>> will come in handy very soon now since we're starting work on a proper
>> interconnect provider (the memory controller driver is the natural fit
>> for this because it has additional knobs to configure latency and
>> priorities, etc.) to implement external memory frequency scaling based
>> on bandwidth requests from memory clients. So this all fits together
>> very nicely. But as I said, I'm not exactly sure what to add as a second
>> entry in "interconnects" to make this compliant with the bindings.
>>

Sounds good to me. The bindings define the two endpoints, but the dma-mem is a
special case and just a single phandle + specifier is fine. Maybe we should
explicitly mention this in the interconnect binding docs. You can look at how
Maxime is using it now in sun5i.dtsi.

Thanks,
Georgi
