From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage-configs PATCH v2] post.mk: Create dependency makefile
 by makefile rule
Date: Wed, 5 Apr 2017 09:26:01 -0600
Message-ID: <bcec42e2-e4c4-b6c4-89ce-4406269fb528@wwwdotorg.org>
References: <20170331150153.14606-1-nikolaus.schulz@avionic-design.de>
 <20170331150153.14606-2-nikolaus.schulz@avionic-design.de>
 <8bf27012-af67-3faf-206b-ebd5cd76b276@wwwdotorg.org>
 <20170403122214.cqth3myvv6tpysr4@avionic-0071.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403122214.cqth3myvv6tpysr4-RM9K5IK7kjJNqqvv04100KcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/03/2017 06:22 AM, Nikolaus Schulz wrote:
> On Fri, Mar 31, 2017 at 09:46:19AM -0600, Stephen Warren wrote:
>> On 03/31/2017 09:01 AM, Nikolaus Schulz wrote:
>>> Creating the emmc image requires creating the bct file and the
>>> bootloader image first.  These dependencies are written to a makefile
>>> snippet that is created by the gen-image-deps.sh script.  But that
>>> script is only invoked when the rule that creates the emmc image is run,
>>> which is too late for creating the dependencies makefile.
>>>
>>> Add a rule to post.mk that tells make how to create the dependencies
>>> makefile; with that in place, make automatically makes the dependency
>>> makefile before executing any other rules.
>>
>> I don't think this change is correct, or at least necessary.
>>
>> The concept here is that:
>>
>> - If an output file does not exist at all, it will be built for the first
>> time, and a dependency file will be generated for the next time.
>>
>> - If an output file does exist, the related dependency file is also expected
>> to exist, and specify the dependencies, so that if they change, a rebuild
>> will occur.
>>
>> In particular, the dependency file is/should-no-be necessary in the case
>> where an output file is to be generated for the first time.
>>
>> If a known dependency specification is missing, we should specify it
>> directly in the makefile itself. The generated dependency files are intended
>> to represent unknown/unknowable dependencies.
>>
>> Is it possible to fix this problem that way instead?
>
> Well, the dependencies in question are hard dependencies: creating the
> emmc image has the bct file and the bootloader image as prerequisites.
>
> I just noticed though that specifying the dependency on the bct file
> need not use gen-image-deps.sh at all, since the bct filename is already
> known to make.  I'll send an alternate, trivial patch.
>
> Note that the dependency on the bootloader image can be added to the
> makefiles in a similar way by simply adding a variable for the filename
> to the per-soc Makefiles and make that a prerequisite of the emmc image.
> With that there is no need for a dynamically generated dependency file
> at all, at the slight expense of some (more) duplication of filenames.
>
> I'll send a separate patch doing that as an RFC.

As mentioned in response to the followup patches you sent, I've decided 
to apply this patch instead. It's now applied. Thanks.
