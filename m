From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
Date: Thu, 2 May 2019 15:27:55 +0100
Message-ID: <94cf6d56-5dcb-051a-06da-5edfacde1655@arm.com>
References: <20190301192017.39770-1-dianders@chromium.org>
 <20190404145957.GA25912@fuggles.cambridge.arm.com>
 <4754bcf1-6423-f1fe-64d4-da4a35b164ad@free.fr>
 <20190424115231.GA14829@fuggles.cambridge.arm.com>
 <20190502105912.GA943@ulmo>
 <20190502110821.GD30966@fuggles.cambridge.arm.com>
 <20190502124525.GA3579@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190502124525.GA3579@ulmo>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will.deacon@arm.com>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, Joerg Roedel <joro@8bytes.org>, Douglas Anderson <dianders@chromium.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On 02/05/2019 13:45, Thierry Reding wrote:
> On Thu, May 02, 2019 at 12:08:21PM +0100, Will Deacon wrote:
>> On Thu, May 02, 2019 at 12:59:12PM +0200, Thierry Reding wrote:
>>> On Wed, Apr 24, 2019 at 12:52:31PM +0100, Will Deacon wrote:
>>>> On Wed, Apr 24, 2019 at 01:36:58PM +0200, Marc Gonzalez wrote:
>>>>> On 04/04/2019 17:00, Will Deacon wrote:
>>>>>
>>>>>> On Fri, Mar 01, 2019 at 11:20:17AM -0800, Douglas Anderson wrote:
>>>>>>
>>>>>>> If you're bisecting why your peripherals stopped working, it's
>>>>>>> probably this CL.  Specifically if you see this in your dmesg:
>>>>>>>    Unexpected global fault, this could be serious
>>>>>>> ...then it's almost certainly this CL.
>>>>>>>
>>>>>>> Running your IOMMU-enabled peripherals with the IOMMU in bypass mode
>>>>>>> is insecure and effectively disables the protection they provide.
>>>>>>> There are few reasons to allow unmatched stream bypass, and even fewer
>>>>>>> good ones.
>>>>>>>
>>>>>>> This patch starts the transition over to make it much harder to run
>>>>>>> your system insecurely.  Expected steps:
>>>>>>>
>>>>>>> 1. By default disable bypass (so anyone insecure will notice) but make
>>>>>>>     it easy for someone to re-enable bypass with just a KConfig change.
>>>>>>>     That's this patch.
>>>>>>>
>>>>>>> 2. After people have had a little time to come to grips with the fact
>>>>>>>     that they need to set their IOMMUs properly and have had time to
>>>>>>>     dig into how to do this, the KConfig will be eliminated and bypass
>>>>>>>     will simply be disabled.  Folks who are truly upset and still
>>>>>>>     haven't fixed their system can either figure out how to add
>>>>>>>     'arm-smmu.disable_bypass=n' to their command line or revert the
>>>>>>>     patch in their own private kernel.  Of course these folks will be
>>>>>>>     less secure.
>>>>>>>
>>>>>>> Suggested-by: Robin Murphy <robin.murphy@arm.com>
>>>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>>>>> ---
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>> - Flipped default to 'yes' and changed comments a lot.
>>>>>>>
>>>>>>>   drivers/iommu/Kconfig    | 25 +++++++++++++++++++++++++
>>>>>>>   drivers/iommu/arm-smmu.c |  3 ++-
>>>>>>>   2 files changed, 27 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> Cheers, I'll pick this one up for 5.2.
>>>>>
>>>>> Hello Will,
>>>>>
>>>>> You haven't pushed this patch out to linux-next AFAICT.
>>>>>
>>>>> Is that expected?
>>>>
>>>> It's on my branch for Joerg:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates
>>>>
>>>> which I'll send to him today. My SMMU stuff doesn't go directly into -next.
>>>
>>> This made it to linux-next yesterday (less than a week before the merge
>>> window opens) and deliberately breaks existing configurations. That's a
>>> little rude.
>>>
>>> At least give people a fair heads-up and a chance to fix things before
>>> you start break things.
>>
>> Sorry about the inconvenience here.
>>
>> This patch has been floating around for a while (albeit not in -next, since
>> I send my stuff via Joerg)
> 
> You can't expect people to test random patches from the list if they're
> not on Cc. I don't think it's safe to claim that patches have been well
> tested until they've been in linux-next for at least a couple of days.
> 
>>                             and is heading for 5.3, so you have ages to fix
>> up your config!
> 
> Last I checked, Joerg applied this for 5.2 because you sent it as part
> of your "Updates for 5.2" pull request.
> 
>>                  It would, of course, be better to configure the IOMMU to
>> provide mappings for your DMA peripherals, but the trivial config change
>> will be enough to keep things working. We won't remove that as long as
>> people are relying on it.
> 
> I don't think the Kconfig option is really useful. People nowadays want
> to run standard distribution kernels on their devices, and distribution
> maintainers will often rely on kernel developers' guidance on what good
> defaults are. This patch suggests that the default should be to disable
> bypass, so if this hits 5.2 final and distributions create their kernel
> packages, they're likely going to go with this default and potentially
> break things for many of their users.
> 
> Luckily this seems like it's fairly easy to fix, but given that we're
> past v5.1-rc6, fixes for this now need to get special treatment. That
> would've been okay if this was a pressing issues, but this is changing
> something that's worked this way for ages, so it's hardly urgent.
> 
>> I don't expect most people to run into problems with this change (the new
>> behaviour matches what SMMUv3 does already).
> 
> I see the ARM SMMU v2 used in quite a few DTS files. Not all of these
> may be problematic, but I'd be somewhat surprised if Tegra was the only
> one impacted.

If people have real technical reasons for needing unmatched stream 
bypass, then we'll probably need to consider some sort of per-SMMU 
override anyway, since well-meaning users rendering the system unusable 
by enabling a security option isn't ideal. I'm in the middle of a big 
rework to accommodate platform-specific extensions more easily, so 
that's certainly an angle I can try to plan for.

On the other hand, if it's merely that nobody's yet got round to filling 
out the DT properly, then AIUI that's pretty much exactly what Doug 
wanted to motivate, so that the option *can* be used more widely by 
users who might want it. Hence the provocative title :)

Robin.
