From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 1/4] Add option "--pkc"
Date: Wed, 9 Mar 2016 10:32:03 -0700
Message-ID: <56E05E13.6090505@wwwdotorg.org>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-2-git-send-email-jimmzhang@nvidia.com>
 <56DDDCC8.9090803@wwwdotorg.org>
 <6dc28718c5ec4d4aba4bcafcf36409be@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6dc28718c5ec4d4aba4bcafcf36409be-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/08/2016 05:50 PM, Jimmy Zhang wrote:
>> Stephen Warren wrote at Monday, March 07, 2016 11:56 AM:
>> On 03/04/2016 04:44 PM, Jimmy Zhang wrote:
>>> Add the support code needed to sign the RCM messages with RSA-PSS as
>>> needed to communicate with secured production devices. This mode is
>>> enabled by passing a key via the --pkc command line argument. If such
>>> a key is set the RCM messages will be signed with it as well as the
>>> bootloader.
>>>
>>> Signed-off-by: Alban Bedel <alban.bedel@...>
>>
>> Part of that s-o-b line has been corrupted.
>>
>> If Alban wrote this, there should be a "From:" line for Alban at the top of the
>> email. Check that "git log" locally shows Alban as the git author of the patch,
>> and "git format-patch" will do the right thing automatically.
>>
>
> I tried not making any changes on Alban's patch. Seems you are suggesting me to make minor changes.

You have changed Alban's patch, and I'm asking you to undo that. If you 
run "git log", you will see that the commit has your name as "Author:" 
whereas it should have Alban's name. Make sure you applied Alban's patch 
using "git am" not "patch", and everything will be correct 
automatically. You can fix this by doing a "git rebase -i" and 
re-applying Alban's patch.

>> Your s-o-b line is missing. It needs to be present even for patches you didn't
>> author, but are simply passing on.
>
> Sure.

There's no need to reply to points you agree with; just make the change 
an include it in V2 along with a changelog entry for it.
