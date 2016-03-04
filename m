From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] AsoC: tegra_max98090: honor headphone detect GPIO
 polarity
Date: Fri, 4 Mar 2016 10:47:41 -0700
Message-ID: <56D9CA3D.5020205@wwwdotorg.org>
References: <56CC9860.2060003@wwwdotorg.org>
 <1456940623-1496-1-git-send-email-sctincman@gmail.com>
 <56D8845A.4050704@wwwdotorg.org> <56D9C921.7080802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D9C921.7080802-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dylan Reid <dgreid-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/04/2016 10:42 AM, Jonathan Tinkham wrote:
>
>
> On 03/03/2016 11:37 AM, Stephen Warren wrote:
>> On 03/02/2016 10:43 AM, Jonathan Tinkham wrote:
>>> Set the invert property for the headphone jack depending on the GPIO
>>> polarity
>>> in the device-tree.
>>>
>>> Signed-off-by: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>
>> I think this is an updatd version of a previous patch, so it should
>> say "[PATCH V2]" in the subject, and have a description of the changes
>> you made between the versions here, below the --- line.
>
> Ah yes, my apologies. For the next version should I increment that to v3
> or v2 then?

May as well make it V3 since that's what it is:-)
