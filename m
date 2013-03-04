From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 6/9] ARM: tegra: use pre-processor for all device trees
Date: Mon, 04 Mar 2013 10:22:19 -0700
Message-ID: <5134D84B.8070908@wwwdotorg.org>
References: <1360791198-29462-1-git-send-email-swarren@wwwdotorg.org> <1360791198-29462-7-git-send-email-swarren@wwwdotorg.org> <20130304084416.0D7653E20E9@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130304084416.0D7653E20E9@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/04/2013 01:44 AM, Grant Likely wrote:
> On Wed, 13 Feb 2013 14:33:15 -0700, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> This enables a C pre-processor pass on all Tegra device trees. This
>> allows future use of #defines and header files in order to define names
>> for various constants, such as the IDs and flags in GPIO specifiers.
>> Use of those features will increase the readability of the device tree
>> files.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/tegra114-dalmore.dts      |   21 -
>>  arch/arm/boot/dts/tegra114-dalmore.dtsp     |   21 +
> 
> Two comments;
> 1) Use '-M' when posting patches that rename files, it makes for a much
>    smaller diff.  :-)

Yes, I forgot this:-( I reposted just this patch with -M IIRC (but maybe
I don't!)

> 2) Now that I see this patch, it's rather striking that .dtsp and .dtsip
>    are horible extensions (so are .dts and .dtsi for that matter, but
>    this just kicks it up a notch). Can we not do something better?
> 
> Can we do something else here; First, does the old style /include/
> directives cause any problems existing .dts files? I know it won't work
> if a /include/'ed file uses a #include statement, but the other way
> around should be fine. Can we instead move the entire tree over to
> building with the CPP enabled? Overall it will be less horribleness for
> the end user.

I think syntactically, now that the *.dtsp->*.dtb rule uses gcc -x
assembler-with-cpp, the only issue would be *.dts that have a # in the
very first column. That's probably rare enough that we can ignore the
issue. A quick grep certainly shows this isn't an issue with any file in
arch/*/boot/dts in the kernel tree right now.

The main reason I didn't go down this route is that dependencies don't
work, at least with the kbuild rules as currently implemented. The
reason is that with /include/, dependencies are emitted by dtc, and with
#include, dependencies are emitted by cpp. Currently, the *.dts->*.dtb
rules only look at the dtc-emitted dependencies, and the *.dtsp->*.dtb
rules only look at the cpp-emitted dependencies.

The solution here would be to augment the dtc+cpp rule to merge together
the two sets of dependencies in a post-processing step. This might be
easy; I'd have to look at the existing dependency post-processing script
to see if it already handles a case like this.
