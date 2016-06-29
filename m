From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 01/10] Documentation: dt-bindings: mailbox: tegra: Add
 binding for HSP mailbox
Date: Wed, 29 Jun 2016 09:28:00 -0600
Message-ID: <5773E900.8060903@wwwdotorg.org>
References: <20160627090248.23621-1-josephl@nvidia.com>
 <20160627090248.23621-2-josephl@nvidia.com> <57714C85.50802@wwwdotorg.org>
 <57724039.7080007@nvidia.com> <5772CB12.5080408@wwwdotorg.org>
 <57736311.6020304@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <57736311.6020304@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jassi Brar <jassisinghbrar@gmail.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Matthew Longnecker <MLongnecker@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 06/28/2016 11:56 PM, Joseph Lo wrote:
> On 06/29/2016 03:08 AM, Stephen Warren wrote:
>> On 06/28/2016 03:15 AM, Joseph Lo wrote:
>>> On 06/27/2016 11:55 PM, Stephen Warren wrote:
>>>> On 06/27/2016 03:02 AM, Joseph Lo wrote:
> snip.
>>>
>>> Currently the usage of HSP HW in the downstream kernel is something like
>>> the model below.
>>>
>>> remote_processor_A-\
>>> remote_processor_B--->hsp@1000 (doorbell func) <-> host CPU
>>> remote_processor_C-/
>>>
>>> remote_processor_D -> hsp@2000 (shared mailbox) <-> CPU
>>>
>>> remote_processor_E -> hsp@3000 (shared mailbox) <-> CPU
>>>
>>> I am thinking if we can just add the appropriate compatible strings for
>>> it to replace "nvidia,tegra186-hsp". e.g. "nvidia,tegra186-hsp-doorbell"
>>> and "nvidia,tegra186-hsp-sharedmailbox". So the driver can probe and
>>> initialize correctly depend on the compatible property. How do you think
>>> about it? Is this the same as the (b) you mentioned above?
>>
>> Yes, that would be (b) above.
>>
>> However, please do note (a): I expect that splitting things up will turn
>> out to be a mistake, as it has for other HW modules in the past. I would
>> far rather see a single hsp node in DT, since there is a single HSP
>> block in HW. Sure that block has multiple sub-functions. However, there
>> is common logic that affects all of those sub-functions and binds
>> everything into a single HW module. If you represent the HW module using
>> multiple different DT nodes, it will be hard to correctly represent that
>> common logic. Conversely, I see no real advantage to splitting up the DT
>> node. I strongly believe we should have a single "hsp" node in DT.
>
> We have 6 HSP block in HW. FYI.

Yes, we have 6 /instances/ of the overall HSP block. Those should each 
have their own node, since they're entirely separate modules, all 
instances of the same configurable IP block.

Above, I was talking about the sub-blocks within each HSP instance, 
which should all be represented into a single node per instance, for a 
total of 6 DT nodes overall.
