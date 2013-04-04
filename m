From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-cbootimage-configs] Add Tegra20 Tamonten configurations
Date: Thu, 04 Apr 2013 13:28:26 -0600
Message-ID: <515DD45A.1040607@wwwdotorg.org>
References: <1365067814-12925-1-git-send-email-thierry.reding@avionic-design.de> <515DBD7F.1010800@wwwdotorg.org> <20130404185929.GA13407@avionic-0098.mockup.avionic-design.de> <515DD042.5000200@wwwdotorg.org> <20130404192543.GA13569@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130404192543.GA13569-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/04/2013 01:25 PM, Thierry Reding wrote:
> On Thu, Apr 04, 2013 at 01:10:58PM -0600, Stephen Warren wrote:
>> On 04/04/2013 12:59 PM, Thierry Reding wrote:
>>> On Thu, Apr 04, 2013 at 11:50:55AM -0600, Stephen Warren
>>> wrote:
>>>> On 04/04/2013 03:30 AM, Thierry Reding wrote:
>>>>> In addition to providing the BCT configuration that is
>>>>> common for all Tegra20 Tamonten-derived boards, add scripts
>>>>> to build images that can be flashed to NAND for the Plutux,
>>>>> Medcom-Wide and TEC boards.
>>>> 
>>>> I wonder why there's a need for board-specific
>>>> sub-directories? After all, those boards all use the same BCT
>>>> file, and the image config files are all identical.
>>> 
>>> I could probably rework it to just generate one image that
>>> uses the standard BCT and the u-boot.bin binary/symlink, which
>>> should work just as well. So if the user wanted to build for
>>> different boards they'd need to replace u-boot.bin and rerun
>>> the script.
>>> 
>>> Does that sound any better?
>> 
>> That sounds better.
>> 
>> Either that, or perhaps create a separate top-level directory for
>> each board, and just symlink the BCT file from one common
>> directory, or even duplicate it. That would still allow the user
>> to have one directory of binaries per board, so remove the need
>> to multiplex.
> 
> I'm not sure I understand correctly. Is this what you're
> proposing?
> 
> tegra20-tamonten |-- tegra20-tamonten.bct.cfg |--
> tegra20-tamonten.img.cfg tegra20-plutux |--
> tegra20-tamonten.bct.cfg -->
> ../tegra20-tamonten/tegra20-tamonten.bct.cfg |--
> tegra20-tamonten.img.cfg -->
> ../tegra20-tamonten/tegra20-tamonten.img.cfg

Yes, or just copy the files.

> |-- build.sh |-- u-boot.bin --> /path/to/u-boot-dtb-tegra.bin
> 
> And build.sh would generate the tegra20-tamonten.bct and build it
> into tegra20-tamonten.img using tegra20-tamonten.img.cfg and
> u-boot.bin. Is that it?
> 
> How is that be different from the current method? What is the
> advantage over what the current scripts do?

It keeps the directory hierarchy the same for the Tamonten boards, so
every board works the same.
