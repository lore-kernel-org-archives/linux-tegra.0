From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 09/11] tegrarcm: Add support for odmdata command
Date: Mon, 16 Sep 2013 15:26:48 -0600
Message-ID: <52377798.5000209@wwwdotorg.org>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com> <1378757761-20939-10-git-send-email-amartin@nvidia.com> <522E436F.90402@wwwdotorg.org> <20130911211228.GC29868@badger> <5230DD8F.4030703@wwwdotorg.org> <20130916202851.GA1663@badger>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130916202851.GA1663@badger>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/16/2013 02:28 PM, Allen Martin wrote:
> On Wed, Sep 11, 2013 at 02:15:59PM -0700, Stephen Warren wrote:
>> On 09/11/2013 03:12 PM, Allen Martin wrote:
>>> On Mon, Sep 09, 2013 at 02:53:51PM -0700, Stephen Warren wrote:
>>>> On 09/09/2013 02:15 PM, Allen Martin wrote:
>>>>> Add command "--odmdata" to pass odmdata down to the miniloader.  This
>>>>> is used by the miniloader for things such as UART init and RAM sizing.
>>>>> It is normally not needed and is really only useful for miniloader
>>>>> debugging.
>>>>
>>>> Does the miniloader put it into the BCT in IRAM so that the bootloader
>>>> can also read it? If suppose we expect the correct ODMDATA to be already
>>>> included in the BCT that tegrarcm sends though, so the bootloader
>>>> already sees the correct value.
>>>
>>> Yes, miniloader will update the BCT with the new value if you send
>>> this command after downloading a BCT.  Really the only thing I'm using
>>> this for is the side effect inside miniloader that causes it to
>>> reinitialize the UART with the new odmdata value.  For some reason
>>> when you donwload the BCT, miniloader does not do that, and when you
>>> boot in recovery mode there's no initial BCT so UART never gets
>>> initialized in miniloader and you get no debug prints.
>>
>> Oh, I wasn't aware that the miniloader ever initialized the UART. Debug
>> prints from what? The miniloader itself, or what it loads (which I think
>> should be initializing the UART from scratch anyway, since I assume the
>> boot ROM doesn't do it for the regular boot path either).
> 
> Yes, debugging the miniloader.  I loaded a debug version of the
> miniloader during venice2 bringup to determine why it was failing and
> added this command so I could see the error messages from it.  It may
> only be useful to me, so I can yank it from the series if you don't
> think it's useful for inclusion in the upstream repository.

It might not be a bad idea to remove it then; having it around will just
encourage people to use it rather than setting the ODMDATA correctly in
the BCT. If/when we get an OSS miniloader replacement, we can always
think about adding it back, although then I'd argue that the UART should
be initialized as a side-effect of downloading/activating the BCT
anyway, so you still wouldn't need the command.
