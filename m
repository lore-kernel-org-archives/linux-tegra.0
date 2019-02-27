From: Ketan Patil <ketanp@nvidia.com>
Subject: [PATCH] sched/cputime: Remove unnecessary assignment statement
Date: Wed, 27 Feb 2019 11:43:22 +0530
Message-ID: <1551248002-27303-1-git-send-email-ketanp@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mingo@redhat.com, peterz@infradead.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, snikam@nvidia.com, bnihalani@nvidia.com, byan@nvidia.com, sgurrappadi@nvidia.com, treding@nvidia.com, talho@nvidia.com, Ketan Patil <ketanp@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The original code assigns the value from rtime to utime variable,
and then jumps to the update label. And the value of utime is then
updated, so the earlier value of utime is not used. Hence remove
that unnecessary assignment statement.

This fixes one of the coverity defects.

Based on work by Ishan Mittal <imittal@nvidia.com>

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 kernel/sched/cputime.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index ba4a143..ad64771 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -616,10 +616,8 @@ void cputime_adjust(struct task_cputime *curr, struct prev_cputime *prev,
 	 * Once a task gets some ticks, the monotonicy code at 'update:'
 	 * will ensure things converge to the observed ratio.
 	 */
-	if (stime == 0) {
-		utime = rtime;
+	if (stime == 0)
 		goto update;
-	}
 
 	if (utime == 0) {
 		stime = rtime;
-- 
2.7.4
