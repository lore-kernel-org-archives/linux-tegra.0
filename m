From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage-configs PATCH v2] post.mk: Create dependency makefile
 by makefile rule
Date: Fri, 31 Mar 2017 09:46:19 -0600
Message-ID: <8bf27012-af67-3faf-206b-ebd5cd76b276@wwwdotorg.org>
References: <20170331150153.14606-1-nikolaus.schulz@avionic-design.de>
 <20170331150153.14606-2-nikolaus.schulz@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170331150153.14606-2-nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/31/2017 09:01 AM, Nikolaus Schulz wrote:
> Creating the emmc image requires creating the bct file and the
> bootloader image first.  These dependencies are written to a makefile
> snippet that is created by the gen-image-deps.sh script.  But that
> script is only invoked when the rule that creates the emmc image is run,
> which is too late for creating the dependencies makefile.
>
> Add a rule to post.mk that tells make how to create the dependencies
> makefile; with that in place, make automatically makes the dependency
> makefile before executing any other rules.

I don't think this change is correct, or at least necessary.

The concept here is that:

- If an output file does not exist at all, it will be built for the 
first time, and a dependency file will be generated for the next time.

- If an output file does exist, the related dependency file is also 
expected to exist, and specify the dependencies, so that if they change, 
a rebuild will occur.

In particular, the dependency file is/should-no-be necessary in the case 
where an output file is to be generated for the first time.

If a known dependency specification is missing, we should specify it 
directly in the makefile itself. The generated dependency files are 
intended to represent unknown/unknowable dependencies.

Is it possible to fix this problem that way instead?
