From: Julius Werner <jwerner@chromium.org>
Subject: Re: nv u-boot for spring (was: building nv-uboot for nyan-big.)
Date: Tue, 4 Nov 2014 14:28:09 -0800
Message-ID: <CAODwPW_kqV=FVUG6GvV74211juBVCkA8RxrfXZoncRieRn+FZw@mail.gmail.com>
References: <54575BFE.2010108@synkhronix.com>
	<54577D88.2070002@suse.de>
	<CAL1qeaFzYRZHdsgZdwN5LV+OaSAPXgTQ+BRTWdsEurj22qC4Yg@mail.gmail.com>
	<CAODwPW_ZbCMEwdtuu9gMD_HLQWynC6ZQjno6xVxFMOBuxRzd+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <CAODwPW_ZbCMEwdtuu9gMD_HLQWynC6ZQjno6xVxFMOBuxRzd+A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Julius Werner <jwerner@chromium.org>
Cc: Andrew Bresticker <abrestic@chromium.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "S.J.R. van Schaik" <stephan@synkhronix.com>, Dylan Reid <dgreid@chromium.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

...and once more with text/plain. Thanks for always forgetting my
settings, GMail. -.-

On Tue, Nov 4, 2014 at 2:26 PM, Julius Werner <jwerner@chromium.org> wrote:
>>
>> Unlike the Exynos Chromebooks, the Tegra Chromebooks do not use U-Boot
>> as their firmware/bootloader - they instead use Coreboot (firmware)
>> and Depthcharge (bootloader) like the x86 Chromebooks.  You can,
>> however, update your firmware with U-Boot as a legacy mode (Ctrl+L at
>> the dev screen) payload - I've added Julius who can provide more
>> detail about this process.
>
>
> The Tegra Chromebooks (Nyan_Big/Acer and Nyan_Blaze/HP) contain the same "legacy mode" feature as x86 Chromebooks... it essentially just loads and jumps to an unverified binary in the RW_LEGACY section of the firmware flash image (1MB starting at 0x300000 for Tegra, visible via "dump_fmap -h image.bin" in a ChromiumOS developer chroot). However, we did not ship any software in that part of the image (unlike most x86 Chromebooks which ship with SeaBIOS) so you will have to build it yourself.
>
> The format used to wrap the blob is a Coreboot File System (CBFS) containing a single file named "payload". You can convert an ELF binary into such a CBFS blob with the cbfstool program bundled with ChromiumOS or upstream coreboot:
>
> # All CBFS images need to have a "bootblock", but since this is not a booting image we just need some empty bytes
> truncate -s 64 bootblock.dummy
> # -s should specify the size of RW_LEGACY on your Chromebook
> cbfstool legacy.bin create -s $((1 * 1024 * 1024)) -B bootblock.dummy -m arm
> cbfstool legacy.bin add-payload -f your_firmware.elf -n payload -c lzma
> # ...and now do the following on your Chromebook in developer mode to overwrite the legacy section
> flashrom -w -i RW_LEGACY:legacy.bin
>
> The legacy section is not write-protected and not checked by the verified boot mechanism, so you do *not* need to open your Chromebook and remove the write-protect screw for this.
>
> I don't know about the state of the upstream "venice2" U-Boot. I do know that the ChromiumOS U-Boot repository has a version for nyan_big and nyan_blaze that will kinda run but has a bunch of issues (I think EC communication and MMC were wonky, and display had never been added at all). It is probably the best place to start. Remember that this will run after coreboot has already initialized most of the system, which may be unexpected for a U-Boot that intended to run right after power-on reset (you may or may not want to skip the SPL in that case). For U-Boot, there is also an additional complexity that it requires a device tree appended to the final raw binary, but cbfstool expects to receive an ELF file... we have a small script in src/third_party/chromiumos-overlay/sys-boot/chromeos-b
 ootimage/files/build_cb_legacy_uboot.sh to resolve that with some objcopies.
>
> We would be very happy if anyone wants to dig into U-Boot and get it working to a point where people could boot ordinary Linux distributions with it on those Chromebooks. We meant to do it ourselves but ran out of time at the end of the project. Let me know if you have any issues getting the legacy firmware mechanism itself to work (that part at least is considered a supported feature).
