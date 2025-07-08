Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FBE800;
	Tue,  8 Jul 2025 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973933; cv=none; b=VXeRvu4mIddhbntlwtHpMy1dF7ArgdLPmuZLytPtSN33s1dMRMpgthdxOfi6TXVStLYOnHxch1NvTiHCd9rMhC9LosRXF6B5p03DHSXl19tS592AtnJSk/1tD0jwKTGmzqetfxBcfkDd5QtdkOE0z1+BTQ1aAJzVVpt7WaTpW+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973933; c=relaxed/simple;
	bh=JUiD3OHZkvFwNBueuTYrgglfm2/gTh23euoM5GCZMQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jeSS2vBq7CiS3EyxFzmccT1+p5lNcJHgqyZblBWHxxk/b2RhdTxiM3OuhE2RJwuOL1k/e4FUZ9WvppJpFjKFp/PNZjol/ZwiI4Fm4YAw4ExOonbbvZ3coJlKuFLJeyhFDaRS9L+z1VJKsUYUBK+RcfIxl2lzia7pUc8KzEpzO0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=DdVqEzC8; arc=none smtp.client-ip=91.232.154.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="DdVqEzC8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1qKAiQmGAGw50txF2hzoeWU/sY/Iea/ABnxsW0p3u8M=; b=DdVqEzC8Eo9m+09q75CC1iVUz7
	iesSJpSvIG+tGOo4nvPLg3DFbHzBdZfe7q3ykcBXSJPLQZmFfwKnWY1zOW3/u4L3fLu7iaOjhH8vj
	Gis6rH2wMJf9yVUx36sbBLOVX8iiq42AF01XvqZPfiwpPiYOaq6OXbC9deP8Ulzx59h9/NrluP0HH
	sHiqTBAT3h60U3fB044e69LnyRZL3z9RR+g+LaJIOmLH32r6FofxhFvJVCra5eu2YN7nqj7IfNWFJ
	mlXhAbeE9Tkqutte3SC+IkjIo1FcOG9aQ8O48gX5Z0UmJC80uJ0CkhDWyoGgOP2jgseDczNj9na+a
	ETkRpeYA==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f] (helo=senjougahara.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1uZ6Rr-008J9k-2C;
	Tue, 08 Jul 2025 14:25:20 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Tue, 08 Jul 2025 20:25:08 +0900
Subject: [PATCH] gpu: host1x: Wait prefences outside MLOCK
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-host1x-wait-prefences-outside-mlock-v1-1-13e98044e35a@nvidia.com>
X-B4-Tracking: v=1; b=H4sIABMAbWgC/x2NywqDMBAAf0X27EJc6MP+SvEQk7Uu1aRkYyuI/
 27qcWCY2UA5CSs8qg0Sf0UlhgJNXYEbbXgxii8MZOhibuaOY9TcrPizkvGTeODgWDEuWcUzzlN
 0b+wHfzVEfetbglL6e7Kel2e37wcNxEtHdQAAAA==
X-Change-ID: 20250708-host1x-wait-prefences-outside-mlock-bfd6022b9d92
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Perttunen <mperttunen@nvidia.com>

The current submission opcode sequence first takes the engine MLOCK,
and then switches to HOST1X class to wait prefences. This is fine
while we only use a single channel per engine and there is no
virtualization, since jobs are serialized on that one channel anyway.
However, when that assumption doesn't hold, we are keeping the
engine locked while not running anything on it while waiting for
prefences to complete.

To resolve this, execute wait commands in the beginning of the job
outside the engine MLOCK. We still take the HOST1X MLOCK because
recent hardware requires register opcodes to be executed within some
MLOCK, but the hardware also allows unlimited channels to take the
HOST1X MLOCK at the same time.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/channel_hw.c | 106 +++++++++++++++++++++++--------------
 1 file changed, 66 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index d44b8de890be05b697a7c4b5be697b708cf41cbb..2df6a16d484e046c9aed6bdf6b59f22de573c9d7 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -47,24 +47,11 @@ static void trace_write_gather(struct host1x_cdma *cdma, struct host1x_bo *bo,
 	}
 }
 
-static void submit_wait(struct host1x_job *job, u32 id, u32 threshold,
-			u32 next_class)
+static void submit_wait(struct host1x_job *job, u32 id, u32 threshold)
 {
 	struct host1x_cdma *cdma = &job->channel->cdma;
 
-#if HOST1X_HW >= 6
-	u32 stream_id;
-
-	/*
-	 * If a memory context has been set, use it. Otherwise
-	 * (if context isolation is disabled) use the engine's
-	 * firmware stream ID.
-	 */
-	if (job->memory_context)
-		stream_id = job->memory_context->stream_id;
-	else
-		stream_id = job->engine_fallback_streamid;
-
+#if HOST1X_HW >= 2
 	host1x_cdma_push_wide(cdma,
 		host1x_opcode_setclass(
 			HOST1X_CLASS_HOST1X,
@@ -76,23 +63,6 @@ static void submit_wait(struct host1x_job *job, u32 id, u32 threshold,
 		id,
 		HOST1X_OPCODE_NOP
 	);
-	host1x_cdma_push_wide(&job->channel->cdma,
-		host1x_opcode_setclass(job->class, 0, 0),
-		host1x_opcode_setpayload(stream_id),
-		host1x_opcode_setstreamid(job->engine_streamid_offset / 4),
-		HOST1X_OPCODE_NOP);
-#elif HOST1X_HW >= 2
-	host1x_cdma_push_wide(cdma,
-		host1x_opcode_setclass(
-			HOST1X_CLASS_HOST1X,
-			HOST1X_UCLASS_LOAD_SYNCPT_PAYLOAD_32,
-			/* WAIT_SYNCPT_32 is at SYNCPT_PAYLOAD_32+2 */
-			BIT(0) | BIT(2)
-		),
-		threshold,
-		id,
-		host1x_opcode_setclass(next_class, 0, 0)
-	);
 #else
 	/* TODO add waitchk or use waitbases or other mitigation */
 	host1x_cdma_push(cdma,
@@ -103,6 +73,32 @@ static void submit_wait(struct host1x_job *job, u32 id, u32 threshold,
 		),
 		host1x_class_host_wait_syncpt(id, threshold)
 	);
+#endif
+}
+
+static void submit_setclass(struct host1x_job *job, u32 next_class)
+{
+	struct host1x_cdma *cdma = &job->channel->cdma;
+
+#if HOST1X_HW >= 6
+	u32 stream_id;
+
+	/*
+	 * If a memory context has been set, use it. Otherwise
+	 * (if context isolation is disabled) use the engine's
+	 * firmware stream ID.
+	 */
+	if (job->memory_context)
+		stream_id = job->memory_context->stream_id;
+	else
+		stream_id = job->engine_fallback_streamid;
+
+	host1x_cdma_push_wide(cdma,
+		host1x_opcode_setclass(next_class, 0, 0),
+		host1x_opcode_setpayload(stream_id),
+		host1x_opcode_setstreamid(job->engine_streamid_offset / 4),
+		HOST1X_OPCODE_NOP);
+#else
 	host1x_cdma_push(cdma,
 		host1x_opcode_setclass(next_class, 0, 0),
 		HOST1X_OPCODE_NOP
@@ -110,7 +106,8 @@ static void submit_wait(struct host1x_job *job, u32 id, u32 threshold,
 #endif
 }
 
-static void submit_gathers(struct host1x_job *job, u32 job_syncpt_base)
+static void submit_gathers(struct host1x_job *job, struct host1x_job_cmd *cmds, u32 num_cmds,
+			   u32 job_syncpt_base)
 {
 	struct host1x_cdma *cdma = &job->channel->cdma;
 #if HOST1X_HW < 6
@@ -119,8 +116,8 @@ static void submit_gathers(struct host1x_job *job, u32 job_syncpt_base)
 	unsigned int i;
 	u32 threshold;
 
-	for (i = 0; i < job->num_cmds; i++) {
-		struct host1x_job_cmd *cmd = &job->cmds[i];
+	for (i = 0; i < num_cmds; i++) {
+		struct host1x_job_cmd *cmd = &cmds[i];
 
 		if (cmd->is_wait) {
 			if (cmd->wait.relative)
@@ -128,7 +125,8 @@ static void submit_gathers(struct host1x_job *job, u32 job_syncpt_base)
 			else
 				threshold = cmd->wait.threshold;
 
-			submit_wait(job, cmd->wait.id, threshold, cmd->wait.next_class);
+			submit_wait(job, cmd->wait.id, threshold);
+			submit_setclass(job, cmd->wait.next_class);
 		} else {
 			struct host1x_job_gather *g = &cmd->gather;
 
@@ -216,7 +214,34 @@ static void channel_program_cdma(struct host1x_job *job)
 
 #if HOST1X_HW >= 6
 	u32 fence;
+	int i = 0;
+
+	if (job->num_cmds == 0)
+		goto prefences_done;
+	if (!job->cmds[0].is_wait || job->cmds[0].wait.relative)
+		goto prefences_done;
+
+	/* Enter host1x class with invalid stream ID for prefence waits. */
+	host1x_cdma_push_wide(cdma,
+		host1x_opcode_acquire_mlock(1),
+		host1x_opcode_setclass(1, 0, 0),
+		host1x_opcode_setpayload(0),
+		host1x_opcode_setstreamid(0x1fffff));
+
+	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_job_cmd *cmd = &job->cmds[i];
+
+		if (!cmd->is_wait || cmd->wait.relative)
+			break;
+
+		submit_wait(job, cmd->wait.id, cmd->wait.threshold);
+	}
+
+	host1x_cdma_push(cdma,
+		HOST1X_OPCODE_NOP,
+		host1x_opcode_release_mlock(1));
 
+prefences_done:
 	/* Enter engine class with invalid stream ID. */
 	host1x_cdma_push_wide(cdma,
 		host1x_opcode_acquire_mlock(job->class),
@@ -230,11 +255,12 @@ static void channel_program_cdma(struct host1x_job *job)
 		host1x_opcode_nonincr(HOST1X_UCLASS_INCR_SYNCPT, 1),
 		HOST1X_UCLASS_INCR_SYNCPT_INDX_F(job->syncpt->id) |
 			HOST1X_UCLASS_INCR_SYNCPT_COND_F(4));
-	submit_wait(job, job->syncpt->id, fence, job->class);
+	submit_wait(job, job->syncpt->id, fence);
+	submit_setclass(job, job->class);
 
 	/* Submit work. */
 	job->syncpt_end = host1x_syncpt_incr_max(sp, job->syncpt_incrs);
-	submit_gathers(job, job->syncpt_end - job->syncpt_incrs);
+	submit_gathers(job, job->cmds + i, job->num_cmds - i, job->syncpt_end - job->syncpt_incrs);
 
 	/* Before releasing MLOCK, ensure engine is idle again. */
 	fence = host1x_syncpt_incr_max(sp, 1);
@@ -242,7 +268,7 @@ static void channel_program_cdma(struct host1x_job *job)
 		host1x_opcode_nonincr(HOST1X_UCLASS_INCR_SYNCPT, 1),
 		HOST1X_UCLASS_INCR_SYNCPT_INDX_F(job->syncpt->id) |
 			HOST1X_UCLASS_INCR_SYNCPT_COND_F(4));
-	submit_wait(job, job->syncpt->id, fence, job->class);
+	submit_wait(job, job->syncpt->id, fence);
 
 	/* Release MLOCK. */
 	host1x_cdma_push(cdma,
@@ -272,7 +298,7 @@ static void channel_program_cdma(struct host1x_job *job)
 
 	job->syncpt_end = host1x_syncpt_incr_max(sp, job->syncpt_incrs);
 
-	submit_gathers(job, job->syncpt_end - job->syncpt_incrs);
+	submit_gathers(job, job->cmds, job->num_cmds, job->syncpt_end - job->syncpt_incrs);
 #endif
 }
 

---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250708-host1x-wait-prefences-outside-mlock-bfd6022b9d92

