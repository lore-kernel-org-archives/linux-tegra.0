From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCHv4 0/4] tegra-cec: add Tegra HDMI CEC support
Date: Thu, 19 Oct 2017 11:36:14 +0200
Message-ID: <0f43276f-0a89-8caa-6522-253458e3ad08@xs4all.nl>
References: <20170911122952.33980-1-hverkuil@xs4all.nl>
 <20171019092054.GC9005@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20171019092054.GC9005@ulmo>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

On 10/19/17 11:20, Thierry Reding wrote:
> On Mon, Sep 11, 2017 at 02:29:48PM +0200, Hans Verkuil wrote:
>> From: Hans Verkuil <hans.verkuil@cisco.com>
>>
>> This patch series adds support for the Tegra CEC functionality.
>>
>> This v4 has been rebased to the latest 4.14 pre-rc1 mainline.
>>
>> Please review! Other than for the bindings that are now Acked I have not
>> received any feedback.
>>
>> The first patch documents the CEC bindings, the second adds support
>> for this to tegra124.dtsi and enables it for the Jetson TK1.
>>
>> The third patch adds the CEC driver itself and the final patch adds
>> the cec notifier support to the drm/tegra driver in order to notify
>> the CEC driver whenever the physical address changes.
>>
>> I expect that the dts changes apply as well to the Tegra X1/X2 and possibly
>> other Tegra SoCs, but I can only test this with my Jetson TK1 board.
>>
>> The dt-bindings and the tegra-cec driver would go in through the media
>> subsystem, the drm/tegra part through the drm subsystem and the dts
>> changes through (I guess) the linux-tegra developers. Luckily they are
>> all independent of one another.
>>
>> To test this you need the CEC utilities from git://linuxtv.org/v4l-utils.git.
>>
>> To build this:
>>
>> git clone git://linuxtv.org/v4l-utils.git
>> cd v4l-utils
>> ./bootstrap.sh; ./configure
>> make
>> sudo make install # optional, you really only need utils/cec*
>>
>> To test:
>>
>> cec-ctl --playback # configure as playback device
>> cec-ctl -S # detect all connected CEC devices
> 
> I finally got around to test this. Unfortunately I wasn't able to
> properly show connected CEC devices, but I think that may just be
> because the monitor I was testing against doesn't support CEC. I
> will have to check against a different device eventually to check
> that it properly enumerates, though I suspect you've already done
> quite extensive testing yourself.

Yes, you need a TV with CEC. Most (all?) PC monitors do not support this.
I never understood why not.

So just to confirm: you've merged this driver for 4.15?

Regards,

	Hans
