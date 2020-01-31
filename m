From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC PATCH v1 0/5] Add Tegra driver for video capture
Date: Fri, 31 Jan 2020 15:29:52 +0100
Message-ID: <8654e6fd-c403-6e68-e5cf-09297b5d8b5d@xs4all.nl>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <a6512e1b-ad0e-3f59-e775-418db4865994@xs4all.nl>
 <20200130154246.GA2904678@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20200130154246.GA2904678@ulmo>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, frankc@nvidia.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 1/30/20 4:42 PM, Thierry Reding wrote:
> On Thu, Jan 30, 2020 at 03:41:50PM +0100, Hans Verkuil wrote:
>> Hi Sowjanya,
>>
>> On 1/28/20 7:23 PM, Sowjanya Komatineni wrote:
>>> This series adds Tegra210 VI and CSI driver for built-in test pattern
>>> generator (TPG) capture.
>>>
>>> Tegra210 supports max 6 channels on VI and 6 ports on CSI where each
>>> CSI port is one-to-one mapped to VI channel for video capture.
>>>
>>> This series has TPG support only where it creates hard media links
>>> between CSI subdevice and VI video device without device graphs.
>>>
>>> v4l2-compliance results are available below the patch diff.
>>>
>>> [v0]:	Includes,
>>> 	- Adds CSI TPG clock to Tegra210 clock driver
>>> 	- Host1x video driver with VI and CSI clients.
>>> 	- Support for Tegra210 only.
>>> 	- VI CSI TPG support with hard media links in driver.
>>> 	- Video formats supported by Tegra210 VI
>>> 	- CSI TPG supported video formats
>>
>> I'm trying to compile this patch series using the media_tree master
>> branch (https://git.linuxtv.org//media_tree.git), but it fails:
>>
>> drivers/staging/media/tegra/tegra-channel.c: In function ‘tegra_channel_queue_setup’:
>> drivers/staging/media/tegra/tegra-channel.c:71:15: warning: unused variable ‘count’ [-Wunused-variable]
>>    71 |  unsigned int count = *nbuffers;
>>       |               ^~~~~
>> drivers/staging/media/tegra/tegra-channel.c: In function ‘tegra_channel_init’:
>> drivers/staging/media/tegra/tegra-channel.c:518:55: error: ‘struct host1x_client’ has no member named ‘host’
>>   518 |  struct tegra_camera *cam = dev_get_drvdata(vi->client.host);
>>       |                                                       ^
>> make[4]: *** [scripts/Makefile.build:265: drivers/staging/media/tegra/tegra-channel.o] Error 1
>> make[4]: *** Waiting for unfinished jobs....
>> drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_tpg_graph_init’:
>> drivers/staging/media/tegra/tegra-vi.c:157:55: error: ‘struct host1x_client’ has no member named ‘host’
>>   157 |  struct tegra_camera *cam = dev_get_drvdata(vi->client.host);
>>       |                                                       ^
>> drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_init’:
>> drivers/staging/media/tegra/tegra-csi.c: In function ‘tegra_csi_init’:
>> drivers/staging/media/tegra/tegra-vi.c:213:51: error: ‘struct host1x_client’ has no member named ‘host’
>>   213 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>       |                                                   ^~
>> drivers/staging/media/tegra/tegra-csi.c:259:51: error: ‘struct host1x_client’ has no member named ‘host’
>>   259 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>       |                                                   ^~
>> drivers/staging/media/tegra/tegra-vi.c: In function ‘tegra_vi_exit’:
>> drivers/staging/media/tegra/tegra-vi.c:246:51: error: ‘struct host1x_client’ has no member named ‘host’
>>   246 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>       |                                                   ^~
>> drivers/staging/media/tegra/tegra-csi.c: In function ‘tegra_csi_exit’:
>> drivers/staging/media/tegra/tegra-csi.c:286:51: error: ‘struct host1x_client’ has no member named ‘host’
>>   286 |  struct tegra_camera *cam = dev_get_drvdata(client->host);
>>       |                                                   ^~
>>
>> And indeed, struct host1x_client as defined in include/linux/host1x.h doesn't
>> have a 'host' field.
>>
>> Does this series depend on another patch that's not yet in mainline?
> 
> Sowjanya's been working on top of linux-next, so, yes, this patch
> depends on a change that's been merged into the DRM tree for v5.6-rc1.
> 
> Thierry
> 

Is there a specific linux-next tag that works? I tried next-20200131 but that
failed to boot. Same problem with the mainline repo since the host1x patches
were merged yesterday. It compiles fine, but the boot just stops. Or am I
missing some kernel config that is now important to have?

Regards,

	Hans
