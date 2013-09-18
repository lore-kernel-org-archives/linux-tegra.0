From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH 2/2] Add config files for Venice2 board
Date: Wed, 18 Sep 2013 16:12:03 -0600
Message-ID: <523A2533.8010706@wwwdotorg.org>
References: <1378943336-9263-1-git-send-email-swarren@wwwdotorg.org> <1378943336-9263-2-git-send-email-swarren@wwwdotorg.org> <523101EA.7020704@wwwdotorg.org> <20130913132252.GN30013@tbergstrom-lnx.Nvidia.com> <52333AF6.9060208@wwwdotorg.org> <52337F1F.9070608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52337F1F.9070608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/13/2013 03:09 PM, Stephen Warren wrote:
> On 09/13/2013 10:19 AM, Stephen Warren wrote:
>> On 09/13/2013 07:22 AM, Peter De Schrijver wrote:
>>> On Thu, Sep 12, 2013 at 01:51:06AM +0200, Stephen Warren wrote:
>>>> On 09/11/2013 05:48 PM, Stephen Warren wrote:
>>>>> This board is currently disabled by default due to lack of U-Boot support
>>>>> in the mainline repository. If you wish to test this, do as follows:
>>>>>
>>>>> cd u-boot
>>>>> git checkout some-branch-with-venice2-support
>>>>> cd ../scripts
>>>>> ./build --boards venice2 build
...
>>> It builds all fine, but flashing as such fails with:
...
> Does the following solve that?
> 
> diff --git a/configs/venice2.config b/configs/venice2.config
> index 15d0b67..4316a1a 100644
> --- a/configs/venice2.config
> +++ b/configs/venice2.config
> @@ -5,4 +5,5 @@ config = {
>      'flash-erase-size': 1048576,
>      'flash-image': 'venice2-spi.img',
>      'flash-type': 'spi',
> +    'flash-id-uboot', '1:0',

I have applied/pushed the original two patches, with this fix squashed
in, plus fixed the syntax error in the line above; the first comma
should be a colon.
